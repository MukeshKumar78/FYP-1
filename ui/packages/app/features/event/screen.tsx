import { createParam } from 'solito';
import { ScrollView, View, StyleSheet } from 'react-native'
import EventPageDraw from './event-page-draw'
import { useNavigation } from '@react-navigation/native'
import { useEffect } from 'react'
import { Image, Text } from 'react-native';
import { PostMap } from '../post/post-map'
import { useGetEventQuery } from './event-api';
import SocietyHeader from 'app/components/SocietyHeader';


const { useParam } = createParam<{ id: string }>()

/**
* Displays event info and a list of posts from that event
*/
export function EventPage() {
  const [id] = useParam('id');
  const navigation = useNavigation();
  const { data } = useGetEventQuery(Number(id));

  useEffect(() => {
    if(data)
      navigation.setOptions({
        headerTitle: () => 
          <SocietyHeader society={data.society}/>
      })
  }, [data, navigation])

  if(!data)
    return <EventScreenError/>

  return (
    <ScrollView style={styles.eventWrapper}>
      <EventPageDraw data={data} />
      <PostMap contentOnly eventId={data.id} />
    </ScrollView>
  )
}



function EventScreenError() {
  return <View style={styles.eventWrapper}>
    <Text>
      Failed to load screen
    </Text>
  </View>
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
  postWrapper: {
    margin: 5,
    backgroundColor: '#E8E8E8',
    borderRadius: 20,
  },
})
