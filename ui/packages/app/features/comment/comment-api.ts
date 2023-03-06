import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const commentApi = api.injectEndpoints({
  endpoints: (build) => ({
    listComments: build.query<EventComment[], number>({
      providesTags: ['Comment'],
      query: (id) => `/api/core/comments?event=${id}`,
    }),
    removeComment: build.mutation<void, number>({
      query(id) {
        return {
          url: `/api/core/comments/${id}`,
          method: 'DELETE',
        }
      }
    }),
  }),
  overrideExisting: false
})

export const { useListCommentsQuery, useRemoveCommentMutation } = commentApi;
