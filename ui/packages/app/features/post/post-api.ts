import { api } from 'app/api';
import { Page, PageData, paginationProps } from 'app/api/util';

interface EventPostPageData extends PageData {
  event: number
}

export const postApi = api.injectEndpoints({
  endpoints: (build) => ({
    getPost: build.query<SocietyPost, number>({
      providesTags: ['Post'],
      query: (id) => `/api/core/posts/${id}`
    }),
    listPosts: build.query<Page<SocietyPost>, PageData>({
      query: ({ page = 0, size = 10 }) => `/api/core/posts?&pageNo=${page}&pageSize=${size}`,
      providesTags: (_) => [{ type: "Post", id: "PAGE" }],
      ...paginationProps<SocietyPost, PageData>()
    }),
    listEventPosts: build.query<Page<SocietyPost>, EventPostPageData>({
      query: ({ page = 0, event, size = 5 }) => `/api/core/posts?pageNo=${page}&event=${event}&pageSize=${size}`,
      providesTags: (_) => [{ type: "Post", id: "EVENTPAGE" }],
      ...paginationProps<SocietyPost, EventPostPageData>()
    }),
    addPost: build.mutation<SocietyPost, FormData>({
      query: (body) => {
        return {
          url: `/api/core/posts`,
          method: 'POST',
          body,
        }
      },
      invalidatesTags: [{ type: 'Post', id: 'PAGE' }, { type: 'Post', id: 'EVENTPAGE' }],
    }),
    removePost: build.mutation<void, number>({
      query(id) {
        return {
          url: `/api/core/posts/${id}`,
          method: 'DELETE',
        }
      },
      invalidatesTags: [{ type: 'Post', id: 'PAGE' }, { type: 'Post', id: 'EVENTPAGE' }],
    })
  }),
  overrideExisting: false
})

export const {
  useListPostsQuery,
  useListEventPostsQuery,
  useAddPostMutation,
  useRemovePostMutation
} = postApi;
