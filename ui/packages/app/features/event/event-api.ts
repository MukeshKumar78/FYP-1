import { api } from 'app/api';
import { Page, PageData, paginationProps } from 'app/api/util';

interface SocietyEventPageData extends PageData {
  society: string
  drafts?: boolean
}

export const eventApi = api.injectEndpoints({
  endpoints: (build) => ({
    getEvent: build.query<SocietyEvent, number>({
      providesTags: ['Event'],
      query: (id) => `/api/core/events/${id}`
    }),
    listEvents: build.query<Page<SocietyEvent>, PageData>({
      query: ({ page = 0, size = 10 }) => `/api/core/events?pageNo=${page}&pageSize=${size}`,
      providesTags: (_) => [{ type: "Post", id: "PAGE" }],
      ...paginationProps<SocietyEvent>()
    }),
    listSocietyEvents: build.query<Page<SocietyEvent>, SocietyEventPageData>({
      query: ({ page = 0, size = 10, society, drafts = false }) =>
        `/api/core/events?society=${society}&drafts=${drafts}&pageNo=${page}&pageSize=${size}`,
      providesTags: (_) => [{ type: "Event", id: "SOCIETYPAGE" }],
      ...paginationProps<SocietyEvent, SocietyEventPageData>()
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
    updateEvent: build.mutation<SocietyEvent, { id: number, data: FormData }>({
      query(event) {
        return {
          url: `/api/core/events/${event.id}`,
          method: 'PUT',
          body: event.data,
        }
      },
      invalidatesTags: [{ type: 'Event', id: 'PAGE' }, { type: 'Event', id: 'SOCIETYPAGE' }],
    }),
  }),
  overrideExisting: false
})

export const {
  useGetEventQuery,
  useListEventsQuery,
  useListSocietyEventsQuery,
  useAddEventMutation,
  usePublishEventMutation
} = eventApi;
