import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

type CommentCreate = {
  event: number | string,
  text: string
}

export const commentApi = api.injectEndpoints({
  endpoints: (build) => ({
    listComments: build.query<EventComment[], number>({
      providesTags: (_) => [ { type: "Comment", id: "PAGE" } ],
      query: (id) => `/api/core/comments?event=${id}`,
    }),
    addComment: build.mutation<EventComment, CommentCreate>({
      query(data) {
        return {
          url: `/api/core/comments`,
          method: 'POST',
          body: data
        }
      },
      invalidatesTags: [{ type: 'Comment', id: 'PAGE' }],
    }),
    removeComment: build.mutation<void, number>({
      query(id) {
        return {
          url: `/api/core/comments/${id}`,
          method: 'DELETE',
        }
      },
      invalidatesTags: [{ type: 'Comment', id: 'PAGE' }],
    }),
  }),
  overrideExisting: false
})

export const { useListCommentsQuery, useAddCommentMutation, useRemoveCommentMutation } = commentApi;
