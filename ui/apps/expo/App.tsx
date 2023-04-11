import { NativeNavigation } from 'app/navigation/native'
import { Provider } from 'app/provider'
import { useEffect } from 'react';
import { StatusBar, StyleSheet } from 'react-native'
import { useFonts } from 'expo-font';
import * as Notifications from 'expo-notifications';

Notifications.setNotificationHandler({
  handleNotification: async () => ({
    shouldShowAlert: true,
    shouldPlaySound: false,
    shouldSetBadge: false,
  }),
});

export default function App() {
  const [fontsLoaded] = useFonts({
    'Raleway': require('./assets/fonts/Raleway-Regular.ttf'),
  });

  useEffect(() => {
    StatusBar.setBarStyle('dark-content', false)
  }, [])


  return (
    <>
      <StatusBar
        barStyle={'dark-content'}
        backgroundColor={'black'}
      />
      <Provider>
        <NativeNavigation />
      </Provider>
    </>
  )
}
