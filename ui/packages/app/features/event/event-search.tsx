import { View, TextInput, ScrollView, StyleSheet, ActivityIndicator } from 'react-native'
import EventDraw from './event-draw'
import { useLazySearchEventsQuery } from './event-api';
import { useCallback, useEffect, useState } from 'react';
import { useHeader } from 'app/hooks/headers';
import { Button, H1 } from 'app/components';

export function EventSearchScreen() {
  const [query, setQuery] = useState("");
  const [events, setEvents] = useState<SocietyEvent[]>([]);
  const [search, result] = useLazySearchEventsQuery();

  const { createHeader } = useHeader();
  useEffect(() => createHeader(<H1>Event Search</H1>), [])

  function handleSearch() {
    search(query)
      .unwrap()
      .then(setEvents)
      .catch(console.error)
  }

  return <ScrollView style={{ padding: 5 }}>
    <TextInput
      style={styles.textInput}
      placeholder='search'
      onChangeText={(value) => setQuery(value)}
    />
    <View style={{ alignItems: 'center' }}>
      <Button onPress={handleSearch} text="Search" style={{ width: '100%' }} disabled={query.length < 3} />
    </View>
    {result && (result.isLoading || result.isFetching) &&
      <ActivityIndicator />
    }
    {events?.map((event, i) => (
      <EventDraw event={event} key={i} />
    ))}
  </ScrollView>


}

const styles = StyleSheet.create({
  textInput: {
    padding: 5,
    backgroundColor: 'white',
    borderRadius: 3,
    marginVertical: 5,
    color: 'black',
    borderColor: 'gainsboro',
    borderWidth: 1
  },
})
