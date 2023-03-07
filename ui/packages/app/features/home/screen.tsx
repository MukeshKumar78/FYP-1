import { View } from 'react-native'
import { EventMap } from '../event/event-map'
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
      <HomeFeedMap/>
    </View>
  )
}
