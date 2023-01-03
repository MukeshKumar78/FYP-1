import { View, H1 } from 'dripsy'
import { EventList } from '../event/event-list'

export function HomeScreen() {

  return (
    <View
      sx={{ 
        backgroundColor: "$background", 
        flex: 1, 
        alignItems: 'center', 
       }}
    >
      <EventList/>

    </View>
  )
}
