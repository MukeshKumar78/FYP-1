import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const postApi = api.injectEndpoints({
  endpoints: (build) => ({
    getPost: build.query<SocietyPost, number>({
      providesTags: ['Post'],
      query: (id) => `/api/core/posts/${id}`
    }),
    listPosts: build.query<SocietyPost[], number|void>({
      providesTags: (result) =>
        // is result available?
        result
          ? // successful query
          [
            ...result.map(({ id }) => ({ type: 'Post', id } as const)),
            { type: 'Post', id: 'LIST' },
          ]
          : // an error occurred, but we still want to refetch this query when `{ type: 'Event', id: 'LIST' }` is invalidated
          [{ type: 'Post', id: 'LIST' }],
      query: (eventId) => eventId 
              ? `/api/core/events/${eventId}/posts`
              : '/api/core/posts'
    }),
  }),
  overrideExisting: false
})

export const { useListPostsQuery } = postApi;
