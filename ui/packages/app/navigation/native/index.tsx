import { createNativeStackNavigator } from '@react-navigation/native-stack'

import { HomeScreen } from '../../features/home/screen'
import { UserDetailScreen } from '../../features/user/detail-screen'

import useAuth from 'app/provider/auth/useAuth';
import { useContext } from 'react';
import { AuthContext } from 'app/provider/auth';

const Stack = createNativeStackNavigator<{
  home: undefined
  'user-detail': {
    id: string
  }
}>()

export function NativeNavigation() {
  const {isSignedIn} = useContext(AuthContext);

  return (
    <Stack.Navigator>
      {isSignedIn ? 
        <Stack.Screen
          name="user-detail"
          component={UserDetailScreen}
          options={{
            title: 'User',
          }}
        />
      :
      <Stack.Screen
        name="home"
        component={HomeScreen}
        options={{
          title: 'Home',
        }}
      />
      }
    </Stack.Navigator>
  )
}
