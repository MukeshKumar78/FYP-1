import React, { createContext, useMemo } from 'react'

// TODO: custom User type
export default interface IAuthContext {
  isSignedIn: boolean,
  loading: boolean,
  userInfo: null
}

export const AuthContext = createContext({} as IAuthContext);

export function AuthProvider({
  children,
}: {
  children: React.ReactNode
}) {


  const authContext = useMemo(() => ({
    isSignedIn: true,
    userInfo: null,
    loading: false,
  }), []);

  return (
    <AuthContext.Provider value={authContext}>
      {children}
    </AuthContext.Provider>
  )
}
