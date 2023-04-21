import { api } from 'app/api'
import { eventApi } from 'app/features/event/event-api'
import authReducer from 'app/features/auth/auth-reducer';
import { configureStore, isRejectedWithValue, Middleware, MiddlewareAPI } from '@reduxjs/toolkit'
import { setupListeners } from '@reduxjs/toolkit/query'
import Toast from 'react-native-toast-message';


const rtkQueryErrorLogger: Middleware =
  (api: MiddlewareAPI) => (next) => (action) => {
    if (isRejectedWithValue(action)) {
      const data = action.payload.data
      if (!data)
        Toast.show({ text1: "Something went wrong" })
      if (data.status == 403 || data.status == 401)
        Toast.show({ type: 'error', text1: "Forbidden" })
      else
        Toast.show({ type: 'error', text1: 'Error!', text2: data.errors?.[0].defaultMessage || data.message || "Something went wrong" })
    }

    return next(action)
  }

const store = configureStore({
  devTools: __DEV__,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(api.middleware, rtkQueryErrorLogger),
  reducer: {
    [api.reducerPath]: api.reducer,
    [eventApi.reducerPath]: eventApi.reducer,
    auth: authReducer
  }
})

setupListeners(store.dispatch)

export default store
export type RootState = ReturnType<typeof store.getState>
