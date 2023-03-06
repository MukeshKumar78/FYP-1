import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const postApi = api.injectEndpoints({
  endpoints: (build) => ({
    getPost: build.query<SocietyPost, number>({
      providesTags: ['Post'],
      query: (id) => `/api/core/posts/${id}`
    }),
    listPosts: build.query<SocietyPost[], number>({
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
      query: (eventId) => `/api/core/posts?event=${eventId}`
    }),
    addPost: build.mutation<SocietyPost, FormData>({
      query: (body) => {
        return {
          url: `/api/core/posts`,
          method: 'POST',
          body,
        }
      },
      // Invalidates all Event-type queries providing the `LIST` id - after all, depending of the sort order,
      // that newly created event could show up in any lists.
      invalidatesTags: [{ type: 'Post', id: 'LIST' }],
    }),
    removePost: build.mutation<void, number>({
      query(id) {
        return {
          url: `/api/core/posts/${id}`,
          method: 'DELETE',
        }
      }
    })
    
  }),
  overrideExisting: false
})

export const { useListPostsQuery, useAddPostMutation } = postApi;
