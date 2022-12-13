import React, { createContext, useEffect, useMemo, useReducer, useState } from 'react'
import {
  GoogleSignin,
  User
} from '@react-native-google-signin/google-signin';

// TODO: custom User type
export default interface IAuthContext {
  signIn: () => Promise<void>
  signOut: () => Promise<void>
  isSignedIn: boolean,
  userInfo: User | null
}

interface AuthState {
  isSignedIn: boolean,
  userInfo: User | null
}

enum AuthActionKind {
  SIGN_IN = 'SIGN_IN',
  SIGN_OUT = 'SIGN_OUT'
}

type AuthAction = {
  type: AuthActionKind.SIGN_OUT,
  user?: never 
} | {
  type: AuthActionKind.SIGN_IN,
  user: User
}

export const AuthContext = createContext({} as IAuthContext);

export function AuthProvider({ 
  children,
}: {
    children: React.ReactNode
}) {

  const [state, dispatch] = useReducer(
    (prevState: AuthState, action: AuthAction) => {
      switch(action.type) {
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
      }
    },
    {
      isSignedIn: false,
      userInfo: null
    }
  )

  useEffect(() => {
    GoogleSignin.isSignedIn()
    .then(isSignedIn => {
        if(isSignedIn)
          GoogleSignin.getCurrentUser()
          .then(user => {
            if(user != null)
              dispatch({
                type: AuthActionKind.SIGN_IN,
                user: user
            })
          }
        )
      })
  }, [])

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
    userInfo: state?.userInfo || null
  }),[state]);

  return (
    <AuthContext.Provider value={authContext}>
      {children}
    </AuthContext.Provider>
  )
}
