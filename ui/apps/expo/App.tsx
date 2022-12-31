import { NativeNavigation } from 'app/navigation/native'
import { Provider } from 'app/provider'
import { useEffect } from 'react';
import { StatusBar, StyleSheet, useColorScheme} from 'react-native'



export default function App() {
  const isDark = useColorScheme() == 'dark';

  useEffect(() => {
    StatusBar.setBarStyle('dark-content', false)
  },[])


  return (
    <>
      <StatusBar 
        barStyle={isDark ? 'dark-content' : 'light-content'}
        backgroundColor={isDark ? 'black': 'white'}
      />
    <Provider>
      <NativeNavigation />
    </Provider>
    </>
  )
}
