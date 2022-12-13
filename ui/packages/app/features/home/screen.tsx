import { View, H1 } from 'dripsy'
import {
  GoogleSigninButton
} from '@react-native-google-signin/google-signin';
import useAuth from 'app/provider/auth/useAuth';

export function HomeScreen() {
  const { signIn } = useAuth();

  return (
    <View
      sx={{ flex: 1, justifyContent: 'center', alignItems: 'center', p: 16 }}
    >
      <H1 sx={{ fontWeight: '800' }}>Welcome to CampusMe.</H1>
      <View sx={{ height: 32 }} />

      <GoogleSigninButton onPress={signIn} />
    </View>
  )
}
