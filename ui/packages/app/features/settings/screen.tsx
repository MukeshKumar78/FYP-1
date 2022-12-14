import { View, H1 } from 'dripsy'
import { useState } from 'react';
import { Switch } from 'react-native'

export function SettingsScreen() {
  const [darkMode, setDarkMode] = useState(false);

  return (
    <View
      sx={{ flex: 1, justifyContent: 'flex-start', alignItems: 'flex-start', p: 16 }}
    >
      <H1 sx={{ fontWeight: '800' }}>Settings</H1>
      <Switch value={darkMode} onChange={() => setDarkMode(!darkMode)}/>

    </View>
  )
}
