import { api } from 'app/api';

// revalidation example: https://redux-toolkit.js.org/rtk-query/usage/mutations#revalidation-example

type MemberCreate = {
  society: string,
  user: string
  role: string
}

type MemberRemove = {
  society: string,
  user: string
}

export const societyApi = api.injectEndpoints({
  endpoints: (build) => ({
    getCurrentSociety: build.query<Society, string>({
      providesTags: (_, __, code) => ['Society', { type: 'Society', id: code }],
      query: (code) => `/api/core/societies/base/${code}/current`
    }),
    getSociety: build.query<Society, string>({
      providesTags: (_, __, code) => ['Society', { type: 'Society', id: code }],
      query: (code) => `/api/core/societies/${code}`
    }),
    getMemberships: build.query<Membership[], string>({
      query: (code) => `/api/core/memberships?society=${code}`,
      providesTags: ['Member']
    }),
    getTenures: build.query<Tenure[], void>({
      query: () => '/api/core/tenures'
    }),
    getRoles: build.query<string[], void>({
      query: () => '/api/core/roles'
    }),
    addMember: build.mutation<Membership, MemberCreate>({
      query(data) {
        return {
          url: `/api/core/memberships`,
          method: 'POST',
          body: data
        }
      },
      invalidatesTags: ['Member'],
    }),
    removeMember: build.mutation<void, MemberRemove>({
      query(data) {
        return {
          url: `/api/core/memberships`,
          method: 'DELETE',
          body: data
        }
      },
      invalidatesTags: ['Member'],
    }),
    muteSociety: build.mutation<boolean, string>({
      query(code) {
        return {
          url: `/api/core/societies/${code}/mute`,
          method: 'POST'
        }
      },
      invalidatesTags: (_, __, code) => [{ type: 'Society', id: code }]
    })
  }),
  overrideExisting: false
})

export const {
  useGetSocietyQuery,
  useGetCurrentSocietyQuery,
  useGetTenuresQuery,
  useLazyGetCurrentSocietyQuery,
  useGetMembershipsQuery,
  useGetRolesQuery,
  useAddMemberMutation,
  useRemoveMemberMutation,
  useMuteSocietyMutation
} = societyApi;
