import { View, Text } from 'dripsy'
// import { createParam } from 'solito'
import { Button } from 'react-native';
import useAuth from 'app/provider/auth/useAuth';

// const { useParam } = createParam<{ id: string }>()

export function UserDetailScreen() {
  const { signOut, userInfo } = useAuth();

  return (
    <View sx={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text
        sx={{ textAlign: 'center', mb: 16, fontWeight: 'bold' }}
      >{`User Info: ${userInfo?.user.email}`}</Text>
      <Button title="Logout" onPress={signOut}/>
    </View>
  )
}
