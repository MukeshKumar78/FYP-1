import { useEffect, useMemo } from "react";
import { useDispatch, useSelector } from "react-redux";
import { setItem } from 'app/api/storage';

import { authState, signIn, signOut } from "./auth-reducer";
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
    console.log('login', 'idtoken', idToken)
    const { token } = await getToken(idToken).unwrap();
    await setItem("jwt", token);
    const { data, isError, error } = await getUser();
    console.log({ data, isError, error });
    if (isError || !data) {
      console.error(error);
      throw new Error("Failed to fetch user data: ", { cause: error })
    }

    console.log("Updated user token");

    return data;
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
            console.error(err, err.cause);
            dispatch(signOut());
          })
      } else {
        getUser()
          .then(({ data, isError }) => {
            if (isError || !data)
              dispatch(signOut()); // Sets loading to false
            else
              dispatch(signIn({ user: data }))
          })
      }
    })
      .catch(err => {
        console.error(err);
        dispatch(signOut());
      })
  }, [])

  return {
    user: useMemo(() => user, [user]),
    loading: useMemo(() => loading, [loading]),
    isSignedIn: useMemo(() => isSignedIn, [isSignedIn]),
    signIn: async (idToken: string | undefined) => {
      try {
        if (idToken) {
          const user = await login(idToken)
          if (user)
            dispatch(signIn({ user }))
        }

      } catch (error) {
        console.error(error);
      }
    },
    signOut: async () => {
      await googleSignOut();
      dispatch(signOut())
    },
  };
}

export function usePermissions(
  society: string | undefined,
  permissions: Permission[]
) {
  const { user } = useAuth();

  const userPermissions = user?.memberships.find(m => m.society.code === society)?.permissions ?? [];

  return permissions.map(p => !!userPermissions.find(u => u == p))
}

export function useMembership(society?: string) {
  const { user } = useAuth();

  return user?.memberships.find(m => m.society.code == society);
}
