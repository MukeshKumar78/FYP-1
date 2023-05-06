import {
  GoogleSignin,
} from '@react-native-google-signin/google-signin';

import { GoogleSigninButton as _GoogleSigninButton } from '@react-native-google-signin/google-signin'

export function GoogleSigninButton({ handleIdToken }: {
  handleIdToken: (token?: string) => void
}) {
  return <_GoogleSigninButton
    onPress={() => {
      signIn()
        .then(user => {
          handleIdToken(user.idToken || undefined)
        })
    }}
  />
}

export async function signIn() {
  try {
    await GoogleSignin.hasPlayServices();
    const googleUserInfo = await GoogleSignin.signIn();

    return googleUserInfo;
  } catch (error) {
    throw new Error("Unable to signin with Google", { cause: error })
  }
}

export async function signOut() {
  await GoogleSignin.signOut();
}

export async function silentSignIn() {
  const isSignedIn = await GoogleSignin.isSignedIn();
  if (isSignedIn) {
    const userInfo = await GoogleSignin.signInSilently();
    if (userInfo != null) {
      return userInfo;
    }
  }
}
