import { View as DView, H1 } from 'dripsy'
import { useState } from 'react'
import { View, Text, Switch, StyleSheet } from 'react-native'

export function SettingsScreen() {
  const [darkMode, setDarkMode] = useState(false)

  return (
    <DView style={styles.settingsWrapper}>
      <H1 style={styles.Title}>Settings</H1>

      <View style={styles.settingContainer}>
        <Text style={styles.settingName}> Setting 1 </Text>
        <Switch value={darkMode} onChange={() => setDarkMode(!darkMode)} />
      </View>

      <View style={styles.settingContainer}>
        <Text style={styles.settingName}> Setting 2 </Text>
        <Switch value={darkMode} onChange={() => setDarkMode(!darkMode)} />
      </View>
    </DView>
  )
}

const styles = StyleSheet.create({
  settingsWrapper: {
    flex: 1,
    justifyContent: 'flex-start',
    alignItems: 'flex-start',
    p: 16,
  },
  Title: {
    fontWeight: '800',
  },
  settingContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    width: '100%',
    height: '10%',
    borderBottomWidth: 1,
    borderBottomColor: '#696969',
    borderBottomStartRadius: 20,
    borderBottomEndRadius: 20,
  },
  settingName: {
    justifyContent: 'center',
  },
  button: {},
})
