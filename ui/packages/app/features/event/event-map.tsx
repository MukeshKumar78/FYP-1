import { RefreshControl, ScrollView, StyleSheet } from 'react-native'
import EventDetails from './event-draw'
import { useListEventsQuery } from './event-api';
import { useCallback, useState } from 'react';
import Button from 'app/components/Button';

/*
* Component to fetch and display a scrollable list of events
*/
export function EventMap() {
  const [page, setPage] = useState(0);
  const { data } = useListEventsQuery(page);
  const [refreshing, setRefreshing] = useState(false);

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    setPage(0); // setting page to 0 resets existing events
    setRefreshing(false);
  }, []);

  function loadMore() {
    setPage(p => p + 1);
  }

  return <>
    <ScrollView
      style={styles.eventWrapper}
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }>
      {data?.events.map((event, i) => (
        <EventDetails event={event} key={i} />
      ))}
      <Button title="Load more" onPress={loadMore} />
    </ScrollView>
  </>
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
})
