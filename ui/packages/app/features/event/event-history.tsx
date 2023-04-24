import { ScrollView } from 'react-native'
import { createParam } from 'solito';
import { EventContent } from './event-draw'
import { useGetEventHistoryQuery } from './event-api';
import { View, Text, Hr } from 'app/components'
import { toTimeAndDateString } from 'app/api/util';
import { Error } from 'app/error';

const { useParam } = createParam<{ id: string }>()

export function EventHistoryScreen() {
  const [id] = useParam('id');
  const { data } = useGetEventHistoryQuery(Number(id));

  if (!data)
    return <Error />

  return <ScrollView >
    {data.map((event, i) => (<View key={i}>
      <Text style={{ color: 'gray', marginTop: 20, textAlign: 'center' }}>{toTimeAndDateString(event.updatedAt)}</Text>
      <EventContent event={event} />
      <Hr />
    </View>
    ))}
  </ScrollView>
}
