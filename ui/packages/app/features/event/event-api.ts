import { api } from 'app/api';
import { Page, PageData, paginationProps } from 'app/api/util';

interface SocietyEventPageData extends PageData {
  society: string
  drafts?: boolean
}

interface SearchEventPageData extends PageData {
  society: string
  query: string
}

export const eventApi = api.injectEndpoints({
  endpoints: (build) => ({
    getEvent: build.query<SocietyEvent, number>({
      providesTags: (event) => {
        if (event)
          return ['Event', { type: 'Event', id: event.id }]
        return ['Event']
      },
      query: (id) => `/api/core/events/${id}`
    }),
    getEventHistory: build.query<SocietyEvent[], number>({
      providesTags: [{ type: 'Event', id: "HISTORY" }],
      query: (id) => `/api/core/events/${id}/history`
    }),
    listEvents: build.query<Page<SocietyEvent>, PageData>({
      query: ({ page = 0, size = 10 }) => `/api/core/events?pageNo=${page}&pageSize=${size}`,
      providesTags: (events) => {
        if (events)
          return [
            { type: "Event", id: "PAGE" },
            ...events.data.map(({ id }) => ({ type: "Event" as const, id }))
          ]
        return [{ type: "Event", id: "PAGE" }]
      },
      ...paginationProps<SocietyEvent>()
    }),
    listSocietyEvents: build.query<Page<SocietyEvent>, SocietyEventPageData>({
      query: ({ page = 0, size = 10, society, drafts = false }) =>
        `/api/core/events?society=${society}&drafts=${drafts}&pageNo=${page}&pageSize=${size}`,
      providesTags: (events) => {
        if (events)
          return [
            { type: "Event", id: "PAGE" },
            ...events.data.map(({ id }) => ({ type: "Event" as const, id }))
          ]
        return [{ type: "Event", id: "PAGE" }]
      },
      ...paginationProps<SocietyEvent, SocietyEventPageData>()
    }),
    searchEvents: build.query<SocietyEvent[], string>({
      query: (query) => `/api/core/events/search?query=${query}`,
      providesTags: (_) => [{ type: "Event", id: "SEARCH" }],
    }),
    addEvent: build.mutation<SocietyEvent, FormData>({
      query(body) {
        return {
          url: `/api/core/events`,
          method: 'POST',
          body,
        }
      },
      invalidatesTags: [{ type: 'Event', id: 'PAGE' }, { type: 'Event', id: 'SOCIETYPAGE' }],
    }),
    publishEvent: build.mutation<SocietyEvent, number>({
      query(id) {
        return {
          url: `/api/core/events/${id}`,
          method: 'PATCH'
        }
      },
      invalidatesTags: [{ type: 'Event', id: 'PAGE' }, { type: 'Event', id: 'SOCIETYPAGE' }],
    }),
    updateEvent: build.mutation<SocietyEvent, { id: number, data: Partial<SocietyEvent> }>({
      query(event) {
        return {
          url: `/api/core/events/${event.id}`,
          method: 'PUT',
          body: event.data,
        }
      },
      invalidatesTags: ['Event', { type: 'Event', id: 'PAGE' }, { type: 'Event', id: 'SOCIETYPAGE' }],
    }),
    react: build.mutation<boolean, number>({
      query(id) {
        return {
          url: `/api/core/events/${id}/react`,
          method: 'POST'
        }
      },
      invalidatesTags: (_, __, id) => [{ type: 'Event', id }]
    })
  }),
  overrideExisting: false
})

export const {
  useGetEventQuery,
  useListEventsQuery,
  useListSocietyEventsQuery,
  useSearchEventsQuery,
  useLazySearchEventsQuery,
  useGetEventHistoryQuery,
  useAddEventMutation,
  useUpdateEventMutation,
  usePublishEventMutation,
  useReactMutation
} = eventApi;
