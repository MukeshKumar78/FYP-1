import { api } from 'app/api';

type TeamCreate = {
  society: string,
  name: string
}

type TeamMemberUpdate = {
  team: string,
  user: string
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
    getTeamMemberships: build.query<TeamMember[], string>({
      query: (code) => `/api/team/memberships?team=${code}`,
      providesTags: ['TeamMember']
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
  useGetTeamMembershipsQuery,
  useAddTeamMutation,
  useRemoveTeamMutation,
  useAddTeamMemberMutation,
  useRemoveTeamMemberMutation
} = teamApi;

