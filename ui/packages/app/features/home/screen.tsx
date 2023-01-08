import { View, H1 } from 'dripsy'
import { EventMap } from '../event/event-map'
import { EventCreate } from '../event/event-create'
import SocietyMap from '../society/society-map'

export function HomeScreen() {
  return (
    <View
      sx={{
        backgroundColor: '$background',
        flex: 1,
        alignItems: 'center',
      }}
    >
      {/* changed current component call for testing */}
      <SocietyMap />
    </View>
  )
}
