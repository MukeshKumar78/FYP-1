import { createNavigationContainerRef, NavigationContainer } from '@react-navigation/native'
import { useDripsyTheme } from 'dripsy'
import * as Linking from 'expo-linking'
import { useMemo } from 'react'

export const navigationRef = createNavigationContainerRef()

export function NavigationProvider({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <NavigationContainer
      linking={useMemo(
        () => ({
          prefixes: [Linking.createURL('/')],
          config: {
            initialRouteName: 'home',
            screens: {
              home: '',
              login: 'login',
              'user-detail': 'user/:id',
              settings: 'settings'
            },
          },
        }),
        []
      )}
    >
      {children}
    </NavigationContainer>
  )
}
