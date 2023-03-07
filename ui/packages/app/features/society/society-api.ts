import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

export const societyApi = api.injectEndpoints({
  endpoints: (build) => ({
    getCurrentSociety: build.query<Society, string>({
      providesTags: ['Society'],
      query: (code) => `/api/core/societies/base/${code}/current`
    }),
    getSociety: build.query<Society, string>({
      providesTags: ['Society'],
      query: (code) => `/api/core/societies/${code}`
    }),
    getMemberships: build.query<Membership[], string>({
      query: (code) => `/api/core/memberships?society=${code}`
    })
  }),
  overrideExisting: false
})

export const { useGetSocietyQuery, useGetCurrentSocietyQuery, useLazyGetCurrentSocietyQuery, useGetMembershipsQuery } = societyApi;
