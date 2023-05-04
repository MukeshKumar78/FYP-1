import { View } from 'react-native'
import { useHeader } from "app/hooks/headers"
import { useEffect } from 'react';
import { HomeFeedMap } from './HomeFeedMap'
import { H1 } from "app/components";

export function HomeScreen() {
  const { createHeader } = useHeader()

  useEffect(() => createHeader(<H1>Home</H1>), [])

  return (
    <View
      style={{
        backgroundColor: '$background',
        flex: 1,
        alignItems: 'center',
      }}
    >
      {/* changed current component call for testing */}
      <HomeFeedMap />
    </View>
  )
}
