import { api } from 'app/api';
import { Page, PageData, paginationProps } from 'app/api/util';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

type CommentCreate = {
  event: number | string,
  text: string
}

interface EventCommentPageData extends PageData {
  event: number | string
}

export const commentApi = api.injectEndpoints({
  endpoints: (build) => ({
    listComments: build.query<Page<EventComment>, EventCommentPageData>({
      query: ({ page = 0, size = 10, event }) => `/api/core/comments?&pageNo=${page}&pageSize=${size}&event=${event}`,
      providesTags: (_) => [{ type: "Comment", id: "PAGE" }],
      ...paginationProps<EventComment, EventCommentPageData>()
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
