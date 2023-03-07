import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

type SocietyPostPage = {
  posts: SocietyPost[]
  data: PageData 
}

type PageData = {
  page: number
  size?: number
  event?: number
}

export const postApi = api.injectEndpoints({
  endpoints: (build) => ({
    getPost: build.query<SocietyPost, number>({
      providesTags: ['Post'],
      query: (id) => `/api/core/posts/${id}`
    }),
    listPosts: build.query<SocietyPostPage, PageData >({
      providesTags: (_) => [ { type: "Post", id: "PAGE" } ],
      query: ({ page = 0, event = '', size = 10 }) => `/api/core/posts?pageNo=${page}&event=${event}&pageSize=${size}`,
      serializeQueryArgs: ({ endpointName }) => {
        return endpointName
      },
      transformResponse(posts: SocietyPost[], _, data) {
        return { posts, data };
      },
      merge(currentCacheData, responseData) {
        if (responseData.data.page > 0) {
          currentCacheData.posts.push(...responseData.posts);
          return currentCacheData;
        }
        return responseData;
      },
      // Refetch when the page arg changes
      forceRefetch({ currentArg, previousArg }) {
        return currentArg !== previousArg
      },
    }),
    addPost: build.mutation<SocietyPost, FormData>({
      query: (body) => {
        return {
          url: `/api/core/posts`,
          method: 'POST',
          body,
        }
      },
      // Invalidates all Post-type queries providing the `LIST` id - after all, depending of the sort order,
      // that newly created event could show up in any lists.
      invalidatesTags: [{ type: 'Post', id: 'PAGE' }],
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
