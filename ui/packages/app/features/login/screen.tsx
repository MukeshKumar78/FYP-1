import { View, H1, useSx } from 'dripsy'
import {
  GoogleSigninButton
} from '@react-native-google-signin/google-signin';
import useAuth from 'app/provider/auth/useAuth';
import { useEffect } from 'react';
import { StyleSheet } from 'react-native';

StyleSheet.create({
  view: { flex: 1, justifyContent: 'center', alignItems: 'center', p: 16, backgroundColor: '$background' },
})

export function LoginScreen() {
  const { signIn, signOut } = useAuth();

  useEffect(() => {
    signOut();
  }, [])

  return (
    <View
      sx={{
        flex: 1, justifyContent: 'center', alignItems: 'center', p: 16, backgroundColor: '$background'
      }}
    >
      <H1 sx={{ fontWeight: '800' }}>Welcome to CampusMe.</H1>
      <View sx={{ height: 32 }} />

      <GoogleSigninButton
        onPress={signIn} />
    </View>
  )
}
