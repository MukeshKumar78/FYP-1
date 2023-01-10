import { createSlice } from '@reduxjs/toolkit'
import type { PayloadAction } from '@reduxjs/toolkit'
import type { RootState } from 'app/api/store'

type AuthState = {
  user: User | null
  loading: boolean
  isSignedIn: boolean
}

const slice = createSlice({
  name: 'auth',
  initialState: { user: null, loading: true, isSignedIn: false } as AuthState,
  reducers: {
    signIn: (state, { payload: { user } }: PayloadAction<{ user: User }>) => {
      state.user = user
      state.loading = false
      state.isSignedIn = true
    },
    signOut: (state) => {
      state.user = null
      state.loading = false
      state.isSignedIn = false
    },
    init: (state) => {
      state.loading = false
    }
  },
})

export const { signIn, signOut, init } = slice.actions

export default slice.reducer

export const authState = (state: RootState) => state.auth
