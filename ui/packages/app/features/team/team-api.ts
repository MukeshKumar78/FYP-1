import { api } from 'app/api';
import { Page, paginationProps } from 'app/api/util';
import { Client, IMessage } from '@stomp/stompjs'
import { apiHost, apiUrl } from "app/api/config";
import { getItem } from 'app/api/storage';


let client: Client
async function getWsClient() {
  const jwt = await getItem("jwt")
  if (!client) {
    const headers = { 'Authorization': jwt as string }
    client = new Client({

      brokerURL: `ws://${apiHost}/ws/team/gs-guide-websocket`,
      connectHeaders: headers,
      debug: console.log,
      appendMissingNULLonIncoming: true,
      forceBinaryWSFrames: true,
    })
  }

  return client
}

type TeamCreate = {
  society: string,
  name: string
}

type TeamMemberUpdate = {
  team: string,
  user: string
}


interface TeamMessagePageData {
  team: string,
  skip: number,
  size: number
}

interface TeamMessagePage {
  data: TeamMessage[]
  args: TeamMessagePageData
}

export const teamApi = api.injectEndpoints({
  endpoints: (build) => ({
    getTeam: build.query<Team, string>({
      providesTags: ['Team'],
      query: (code) => `/api/team/${code}`
    }),
    getTeamsBySociety: build.query<Team[], string>({
      query: (code) => `/api/team?society=${code}`,
      providesTags: ['Team']
    }),
    getTeamMembershipsByTeam: build.query<TeamMember[], string>({
      query: (code) => `/api/team/memberships?team=${code}`,
      providesTags: ['TeamMember']
    }),
    getTeamMemberships: build.query<TeamMember[], void>({
      query: () => `/api/team/memberships`,
      providesTags: ['TeamMember']
    }),
    sendMessage: build.mutation<null, { msg: string, team: string }>({
      queryFn: async ({ msg, team }) => {
        const ws = await getWsClient()

        return new Promise(res => {
          ws.publish({
            body: msg,
            destination: `/app/chat/${team}`,
          })
          res({ data: null })
        })
      }
    }),
    listMessages: build.query<TeamMessagePage, TeamMessagePageData>({
      query: ({ team, skip = 0, size = 10 }) => `/api/team/chat/${team}?skip=${skip}&size=${size}`,
      providesTags: (_) => [{ type: "TeamMessage", id: "PAGE" }],
      serializeQueryArgs: ({ endpointName }) => {
        return endpointName
      },
      merge(currentCacheData: TeamMessagePage, responseData: TeamMessagePage): void | TeamMessagePage {
        if (responseData.args.skip > 0) {
          responseData.data.push(...currentCacheData.data);
          return responseData;
        }
        return responseData;
      },
      transformResponse(data: TeamMessage[], _: any, args: Required<TeamMessagePageData>) {
        data.reverse()
        return { data, args };
      },
      // // Refetch when the page arg changes
      forceRefetch({ currentArg, previousArg }: {
        currentArg?: TeamMessagePageData,
        previousArg?: TeamMessagePageData
      }) {
        let doRefetch = true

        if (currentArg && previousArg)
          doRefetch = !(Object.entries(currentArg).toString() === Object.entries(previousArg).toString())

        return doRefetch
      },
      async onCacheEntryAdded(
        arg,
        { updateCachedData, cacheDataLoaded, cacheEntryRemoved }
      ) {
        const ws = await getWsClient()

        try {
          // wait for the initial query to resolve before proceeding
          await cacheDataLoaded

          ws.onConnect = (f) => {
            ws.subscribe(`/team/${arg.team}`, (msg: IMessage) => {
              const data = JSON.parse(msg.body)

              updateCachedData((draft) => {
                draft.data.push(data)
              })
            }, ws.connectHeaders)
          }

          ws.activate()
        } catch (e) {
          console.error(e)
          // no-op in case `cacheEntryRemoved` resolves before `cacheDataLoaded`,
          // in which case `cacheDataLoaded` will throw
        }
        // cacheEntryRemoved will resolve when the cache subscription is no longer active
        await cacheEntryRemoved
        // perform cleanup steps once the `cacheEntryRemoved` promise resolves
        ws.deactivate()
      },
    }),
    addTeam: build.mutation<void, TeamCreate>({
      query(data) {
        return {
          url: `/api/team`,
          method: 'POST',
          body: data
        }
      },
      invalidatesTags: ['Team'],
    }),
    removeTeam: build.mutation<void, string>({
      query(code) {
        return {
          url: `/api/team/${code}`,
          method: 'DELETE',
        }
      },
      invalidatesTags: ['Team'],
    }),
    addTeamMember: build.mutation<void, TeamMemberUpdate>({
      query(data) {
        return {
          url: `/api/team/memberships`,
          method: 'POST',
          body: data
        }
      },
      invalidatesTags: ['TeamMember'],
    }),
    removeTeamMember: build.mutation<void, TeamMemberUpdate>({
      query(data) {
        return {
          url: `/api/team/memberships`,
          method: 'DELETE',
          body: data
        }
      },
      invalidatesTags: ['TeamMember'],
    }),
  }),
  overrideExisting: false
})

export const {
  useGetTeamQuery,
  useGetTeamsBySocietyQuery,
  useGetTeamMembershipsByTeamQuery,
  useGetTeamMembershipsQuery,
  useListMessagesQuery,
  useSendMessageMutation,
  useAddTeamMutation,
  useRemoveTeamMutation,
  useAddTeamMemberMutation,
  useRemoveTeamMemberMutation
} = teamApi;

