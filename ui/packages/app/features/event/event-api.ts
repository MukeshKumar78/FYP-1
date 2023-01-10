import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const eventApi = api.injectEndpoints({
  endpoints: (build) => ({
    listEvents: build.query<SocietyEvent[], void>({
      providesTags: (result) =>
        // is result available?
        result
          ? // successful query
          [
            ...result.map(({ id }) => ({ type: 'Event', id } as const)),
            { type: 'Event', id: 'LIST' },
          ]
          : // an error occurred, but we still want to refetch this query when `{ type: 'Event', id: 'LIST' }` is invalidated
          [{ type: 'Event', id: 'LIST' }],
      query: () => '/api/core/events'
    }),
    addEvent: build.mutation<SocietyEvent, Partial<SocietyEvent>>({
      query(body) {
        return {
          url: '/api/core/events',
          method: 'POST',
          body,
        }
      },
      // Invalidates all Event-type queries providing the `LIST` id - after all, depending of the sort order,
      // that newly created event could show up in any lists.
      invalidatesTags: [{ type: 'Event', id: 'LIST' }],
    }),
  }),
  overrideExisting: false
})

export const { useListEventsQuery } = eventApi;
