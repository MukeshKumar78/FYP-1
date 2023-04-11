import {
  GoogleSigninButton
} from './google';
import { useAuth } from './hooks';
import { useEffect } from 'react';
import { View, Text } from 'react-native';

export function LoginScreen() {
  const { signIn, signOut } = useAuth();

  useEffect(() => {
    signOut();
  }, [])

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
