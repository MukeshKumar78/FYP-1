import { View, H1 } from 'dripsy'
import { EventMap } from '../event/event-map'

export function HomeScreen() {
  return (
    <View
      sx={{
        backgroundColor: '$background',
        flex: 1,
        alignItems: 'center',
      }}
    >
      <EventMap />
    </View>
  )
}
