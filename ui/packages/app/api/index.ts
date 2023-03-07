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
    login: builder.mutation<LoginResponse, string>({
      query: (token) => ({
        url: '/token',
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}` // override app token with google idtoken
        },
      }),
    }),
    me: builder.query<User, void>({
      query: () => 'api/core/me' // change to 'me'
    }),
    user: builder.query<User, string>({
      query: (code: string) => `api/core/users/${code}`
    })
  }),
  reducerPath: 'api',
  tagTypes: ['Event', 'Society', 'Post', 'Comment'],
})

export const { useLoginMutation, useUserQuery, useMeQuery, useLazyMeQuery } = api;
