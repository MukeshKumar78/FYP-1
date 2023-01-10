import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const societyApi = api.injectEndpoints({
  endpoints: (build) => ({
    getSociety: build.query<Society, number>({
      providesTags: ['Society'],
      query: (id) => `/api/core/societies/${id}`
    }),
  }),
  overrideExisting: false
})

export const { useGetSocietyQuery, useLazyGetSocietyQuery } = societyApi;
