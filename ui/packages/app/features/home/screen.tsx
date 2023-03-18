import { View } from 'react-native'
import { HomeFeedMap } from './HomeFeedMap'

export function HomeScreen() {
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
