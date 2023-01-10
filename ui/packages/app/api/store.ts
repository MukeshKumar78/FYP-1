import { api } from 'app/api'
import { eventApi } from 'app/features/event/event-api'
import authReducer from 'app/features/auth/auth-reducer';
import { configureStore } from '@reduxjs/toolkit'
import { setupListeners } from '@reduxjs/toolkit/query'


const store = configureStore({
  devTools: __DEV__,
  middleware: (getDefaultMiddleware) => 
    getDefaultMiddleware().concat(api.middleware),
  reducer: {
    [api.reducerPath]: api.reducer,
    [eventApi.reducerPath]: eventApi.reducer,
    auth: authReducer
  }
})

setupListeners(store.dispatch)

export default store
export type RootState = ReturnType<typeof store.getState>
