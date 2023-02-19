import { View } from 'react-native'
import { EventMap } from '../event/event-map'

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
      <EventMap/>
    </View>
  )
}
