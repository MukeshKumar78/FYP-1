import { createNavigationContainerRef, NavigationContainer } from '@react-navigation/native'
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
              'user-detail': 'user/:code',
              event: 'event/:id',
              "event-create": "society/:code/new-event",
              "post-create": "event/:eventId/new-post",
              society: 'society/:code',
              "edit-society": 'society/:code/edit',
              settings: 'settings',
              comments: 'event/:eventId/comments'
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
