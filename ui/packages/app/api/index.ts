import * as SecureStore from 'expo-secure-store';
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { API_URL } from "@env";

console.log("using API URL: ", API_URL);

export interface LoginResponse {
  user: User
  token: string
}

export const api = createApi({
  baseQuery: fetchBaseQuery({
    baseUrl: API_URL,
    prepareHeaders: async (headers, api) => {
      const userToken = await SecureStore.getItemAsync('jwt');

      if (userToken && !headers.has('Authorization')) {
        headers.set('Authorization', `Bearer ${userToken}`)
      }

      if(!headers.has('Content-Type'))
        headers.set('Content-Type', 'application/json')

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
        }
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
  tagTypes: ['Event', 'Society', 'Post'],
})

export const { useLoginMutation, useUserQuery, useMeQuery, useLazyMeQuery } = api;
