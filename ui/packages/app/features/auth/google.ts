import {
  GoogleSignin,
} from '@react-native-google-signin/google-signin';

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
