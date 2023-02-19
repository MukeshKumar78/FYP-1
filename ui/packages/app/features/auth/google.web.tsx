import { GoogleLogin, useGoogleLogin } from '@react-oauth/google';

export async function signIn() {
  try {
  } catch (error) {
    throw new Error("Unable to signin with Google", { cause: error })
  }
}

export async function signOut() {
  return Promise.resolve();
}

export async function silentSignIn() {
  return Promise.resolve();
}

export function GoogleSigninButton({ handleIdToken }) {
  return <GoogleLogin
    onSuccess={credentialResponse => {
      const { credential: idToken } = credentialResponse;
      handleIdToken(idToken);
    }}
    onError={() => {
      console.log('Google Login Failed');
    }}
  />;
}
