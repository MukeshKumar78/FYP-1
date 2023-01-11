import * as SecureStore from 'expo-secure-store';
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import Constants from 'expo-constants';

export interface LoginResponse {
  user: User
  token: string
}

export const api = createApi({
  baseQuery: fetchBaseQuery({
    baseUrl: `http://${Constants.expoConfig?.extra?.apiRoot}:8080`,
    prepareHeaders: async (headers, api) => {
      const userToken = await SecureStore.getItemAsync('jwt');

      if (userToken && api.endpoint !== 'login') {
        headers.set('Authorization', `Bearer ${userToken}`)
      }

      headers.set('Content-Type', 'application/json')

      return headers
    },
    timeout: 3000,
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
      query: () => 'api/core/users/2' // change to 'me'
    }),
    user: builder.query<User, number>({
      query: (id: number) => `api/core/users/${id}`
    })
  }),
  reducerPath: 'api',
  tagTypes: ['Event', 'Society', 'Post'],
})

export const { useLoginMutation, useUserQuery, useMeQuery, useLazyMeQuery } = api;
