import { createParam } from 'solito';
import { ScrollView, View, StyleSheet } from 'react-native'
import EventPageDraw from './event-page-draw'
import { useNavigation } from '@react-navigation/native'
import { useEffect } from 'react'
import { Image, Text } from 'react-native';
import { PostMap } from '../post/post-map'
import { useGetEventQuery } from './event-api';


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
          <SocietyHeader 
            title={data.society.name}
            image={data.society.image}
          />
      })
  }, [data])

  if(!data)
    return <EventScreenError/>

  return (
    <ScrollView style={styles.eventWrapper}>
      <EventPageDraw data={data} />
      <PostMap contentOnly eventId={data.id} />
    </ScrollView>
  )
}

export function SocietyHeader({ image, title }: {
  image: string
  title: string
}) {
  return (
    <View style={styles.eventHeaderWrapper}>
      <Image
        style={styles.eventHeaderImage}
        source={{ uri: image }}
      />
      <Text style={styles.eventHeaderTitle}>{title}</Text>
    </View>
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
  eventHeaderWrapper: {
    flexDirection: 'row',
    alignItems: 'center'
  },
  eventHeaderImage: {
    margin: 10,
    width: 40,
    height: 40,
    borderRadius: 50
  },
  eventHeaderTitle: {
    fontWeight: 'bold',
    fontSize: 20
  },
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
