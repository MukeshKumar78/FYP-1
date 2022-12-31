import React, { createContext, useEffect, useMemo, useReducer } from 'react'
import {
  GoogleSignin,
  User
} from '@react-native-google-signin/google-signin';

// TODO: custom User type
export default interface IAuthContext {
  signIn: () => Promise<void>
  signOut: () => Promise<void>
  isSignedIn: boolean,
  loading: boolean,
  userInfo: User | null
}

interface AuthState {
  loading: boolean,
  isSignedIn: boolean,
  userInfo: User | null
}

enum AuthActionKind {
  SIGN_IN = 'SIGN_IN',
  SIGN_OUT = 'SIGN_OUT',
  INIT = 'INIT'
}

type AuthAction = {
  type: AuthActionKind.SIGN_IN,
  user: User
} | {
  type: AuthActionKind,
  user?: never
}

export const AuthContext = createContext({} as IAuthContext);

export function AuthProvider({
  children,
}: {
  children: React.ReactNode
}) {

  const [state, dispatch] = useReducer(
    (prevState: AuthState, action: AuthAction) => {
      switch (action.type) {
        case AuthActionKind.SIGN_IN:
          return {
            ...prevState,
            userInfo: action.user,
            isSignedIn: true,
          };
        case AuthActionKind.SIGN_OUT:
          return {
            ...prevState,
            userInfo: null,
            isSignedIn: false
          };
        case AuthActionKind.INIT:
          return {
            ...prevState,
            loading: false
          }
      }
    },
    {
      loading: true,
      isSignedIn: false,
      userInfo: null
    }
  )

  useEffect(() => {
    const trySilentSignIn = async () => {
      const isSignedIn = await GoogleSignin.isSignedIn();
      if (isSignedIn) {
        const userInfo = await GoogleSignin.getCurrentUser();
        if (userInfo != null) {
          dispatch({
            type: AuthActionKind.SIGN_IN,
            user: userInfo
          })
        }
      }
    }
    trySilentSignIn()
      .then(() => dispatch({ type: AuthActionKind.INIT }))

  }, [])

  useEffect(() => {
    console.log("AuthState:", { 
      isSignedIn: state.isSignedIn, 
      loading: state.loading, 
      user: state?.userInfo?.user.name 
    })
  }, [state])

  const authContext = useMemo(() => ({
    signIn: async () => {
      try {
        await GoogleSignin.hasPlayServices();
        const userInfo = await GoogleSignin.signIn();
        console.log(userInfo);

        // TODO: use idToken and get userInfo from backend
        dispatch({
          type: AuthActionKind.SIGN_IN,
          user: userInfo
        })
      } catch (error) {
        console.error(error.message);
      }
    },
    signOut: async () => {
      await GoogleSignin.signOut();
      dispatch({
        type: AuthActionKind.SIGN_OUT
      })
    },
    isSignedIn: state?.isSignedIn || false,
    userInfo: state?.userInfo || null,
    loading: state ? state.loading : true,
  }), [state]);

  return (
    <AuthContext.Provider value={authContext}>
      {children}
    </AuthContext.Provider>
  )
}
