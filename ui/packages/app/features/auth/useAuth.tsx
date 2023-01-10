import { useEffect, useMemo } from "react";
import { useDispatch, useSelector } from "react-redux";
import * as SecureStore from 'expo-secure-store';

import { authState, init, signIn, signOut } from "./auth-reducer";
import {
  signIn as googleSignIn,
  signOut as googleSignOut,
  silentSignIn as googleSilentSignIn
} from './google';
import { useLazyMeQuery, useLoginMutation } from "app/api";

export default function useAuth() {
  const dispatch = useDispatch();

  const { user, loading, isSignedIn } = useSelector(authState);
  const [getToken] = useLoginMutation();
  const [getUser] = useLazyMeQuery();

  async function login(idToken: string): Promise<User | null> {
    try {
      const { token } = await getToken(idToken).unwrap();
      const { data, isError, error } = await getUser();
      console.log({data, isError, error});
      if (isError || !data) {
        console.error(error);
        throw new Error("Failed to fetch user data: ", { cause: error })
      }

      SecureStore.setItemAsync("jwt", token);
      console.log("Updated user token");

      return data;
    } catch (err) {
      console.error("Failed to authenticate with API", err);
    }
    return null;
  }

  useEffect(() => {
    if (!loading)
      return

    // else try signing in silently and refresh token
    googleSilentSignIn().then(user => {
      if (user && user.idToken) {
        login(user.idToken)
          .then((user) => {
            if (user)
              dispatch(signIn({ user }))
          })
          .catch(err => {
            console.error(err);
          })
      } else {
        // Sets loading to false
        dispatch(signOut());
      }
    })
  }, [])

  return {
    user: useMemo(() => user, [user]),
    loading: useMemo(() => loading, [loading]),
    isSignedIn: useMemo(() => isSignedIn, [isSignedIn]),
    signIn: async () => {
      try {
        const googleUserInfo = await googleSignIn();

        if (googleUserInfo && googleUserInfo.idToken) {
          const user = await login(googleUserInfo.idToken)
          if (user)
            dispatch(signIn({ user }))
        }

      } catch (error) {
        console.error(error.message);
      }
    },
    signOut: async () => {
      await googleSignOut();
      dispatch(signOut())
    },
  };
}
