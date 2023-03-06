import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

type SocietyEventPage = {
  events: SocietyEvent[],
  page: number | void
}

export const eventApi = api.injectEndpoints({
  endpoints: (build) => ({
    getEvent: build.query<SocietyEvent, number>({
      providesTags: ['Event'],
      query: (id) => `/api/core/events/${id}`
    }),
    listEvents: build.query<SocietyEventPage, number | void>({
      providesTags: (_) => [ { type: "Event", id: "PAGE" } ],
      query: (page = 0) => `/api/core/events?pageNo=${page}`,
      serializeQueryArgs: ({ endpointName }) => {
        return endpointName
      },
      transformResponse(events: SocietyEvent[], _, page) {
        return { events, page };
      },
      merge(currentCacheData, responseData) {
        if (responseData.page > 0) {
          currentCacheData.events.push(...responseData.events);
          return currentCacheData;
        }
        return responseData;
      },
      // Refetch when the page arg changes
      forceRefetch({ currentArg, previousArg }) {
        return currentArg !== previousArg
      },
    }),
    addEvent: build.mutation<SocietyEvent, FormData>({
      query(body) {
        return {
          url: `/api/core/events`,
          method: 'POST',
          body,
        }
      },
      invalidatesTags: [{ type: 'Event', id: 'PAGE' }],
    }),
  }),
  overrideExisting: false
})

export const { useGetEventQuery, useListEventsQuery, useAddEventMutation } = eventApi;
