import {
  GoogleSigninButton
} from './google';
import { useAuth } from './hooks';
import { useEffect, useLayoutEffect } from 'react';
import { View, Text } from 'react-native';
import { LoadingScreen } from 'app/features/loading/screen';

export function LoginScreen() {
  const { signIn } = useAuth();

  return (
    <View
      style={{
        flex: 1, justifyContent: 'center', alignItems: 'center', padding: 16
      }}
    >
      <Text style={{ fontWeight: '800', fontSize: 25 }}>Welcome to CampusMe.</Text>
      <View style={{ height: 32 }} />

      <GoogleSigninButton handleIdToken={signIn} />
    </View>
  )
}


export function LogoutScreen() {
  const { signOut } = useAuth();

  useLayoutEffect(() => {
    signOut()
  }, [])

  return <LoadingScreen />
}
