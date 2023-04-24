import { getItem } from './storage';
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { apiUrl } from "./config";

console.log("using API URL: ", apiUrl);

export interface LoginResponse {
  user: User
  token: string
}

export const api = createApi({
  baseQuery: fetchBaseQuery({
    baseUrl: apiUrl,
    prepareHeaders: async (headers) => {
      const userToken = await getItem('jwt');

      if (userToken && !headers.has('Authorization')) {
        headers.set('Authorization', `Bearer ${userToken}`)
      }

      return headers
    },
    timeout: 10000,
  }),
  endpoints: (builder) => ({
    login: builder.mutation<LoginResponse, { idToken: string, pushToken: string }>({
      query: ({ idToken, pushToken }) => ({
        url: `/token?pushToken=${pushToken}`,
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${idToken}` // override app token with google idtoken
        },
      }),
    }),
    me: builder.query<User, void>({
      query: () => 'api/core/me'
    }),
    user: builder.query<User, string>({
      query: (code: string) => `api/core/users/${code}`
    })
  }),
  reducerPath: 'api',
  tagTypes: ['Event', 'Society', 'Team', 'Post', 'Comment', 'Member', 'TeamMember', 'TeamMessage'],
})

export const { useLoginMutation, useUserQuery, useMeQuery, useLazyMeQuery } = api;
