import { H1 } from 'dripsy'
import { ScrollView, View, StyleSheet } from 'react-native'
import EventPageDraw from './event-page-draw'
import PostContent from '../post/post-content-draw'
import { useNavigation } from '@react-navigation/native'
import { useEffect } from 'react'
import { Image, Text } from 'react-native';
import { PostMap } from '../post/post-map'


const event: SocietyEvent = {
  id: 2,
  title: 'Annual Tour',
  text: `sample text`,
  image: 'https://picsum.photos/1220/720',
  startDate: new Date(),
  endDate: new Date(),
  society: {
    id: 1,
    name: 'DECS',
    fullName: "Death England Custom Societyyyyyy",
    image: 'https://picsum.photos/500',
    createdAt: new Date(),
    tenure: {
      id: 1,
      code: 'yoo',
      description: 'bruh',
      duration: '2022-2023',
    },
  },
}


// MAPPER COMPONENT THAT MAPS ALL EVENT DATA
export function EventPage({ id }: { id: string }) {

  const navigation = useNavigation();

  useEffect(() => {
    navigation.setOptions({
      headerTitle: () => 
        <SocietyHeader 
          title={event.society.name}
          image={event.society.image}
        />
    })
  }, [])

  return (
    <ScrollView style={styles.eventWrapper}>
      <EventPageDraw data={event} />
      {/* POSTS MAPPER */}
      <PostMap eventId={event.id} />
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
