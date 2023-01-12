import { RefreshControl, ScrollView, StyleSheet } from 'react-native'
import EventDetails from './event-draw'
import { useListEventsQuery } from './event-api';
import { useCallback, useState } from 'react';

/*
* Component to fetch and display a scrollable list of events
*/
export function EventMap() {
  const { data = [], refetch } = useListEventsQuery();
  const [refreshing, setRefreshing] = useState(false);

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    refetch();
    setTimeout(() => {
      setRefreshing(false);
    }, 2000);
  }, []);

  return (
    <ScrollView
      style={styles.eventWrapper}
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }
    >
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
