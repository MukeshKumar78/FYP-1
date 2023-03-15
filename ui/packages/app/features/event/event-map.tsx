import { View, RefreshControl, ScrollView, StyleSheet } from 'react-native'
import EventDraw from './event-draw'
import { useListEventsQuery } from './event-api';
import { useCallback, useState } from 'react';
import { Button } from 'app/components';

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
        <EventDraw event={event} key={i} />
      ))}
      <View style={{ marginVertical: 10, alignItems: 'center' }}>
        <Button type="outlined" text="Load more" onPress={loadMore} />
      </View>
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
