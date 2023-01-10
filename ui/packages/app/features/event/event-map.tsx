import { ScrollView, StyleSheet } from 'react-native'
import EventDetails from './event-draw'
import { useListEventsQuery } from './event-api';

/*
* Component to fetch and display a scrollable list of events
*/
export function EventMap() {
  const { data = [] } = useListEventsQuery();

  return (
    <ScrollView style={styles.eventWrapper}>
      {/* EVENT MAPPER */}
      {data.map((event, i) => (
        <EventDetails event={event} key={i} />
      ))}
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
})
