import { ScrollView, StyleSheet, RefreshControl } from 'react-native'
import { useEffect } from 'react'
import { View, Text, Button } from 'app/components'
import { PostMap } from '../post/post-map'
import { ScaledImage } from 'app/components/ScaledImage'
import EventOptionsModal from './event-options-modal'
import { EventInteractiveBar } from './event-draw'
import { useGetEventQuery } from './event-api';
import { useSocietyHeader } from 'app/hooks/headers';
import { createParam } from 'solito';
import { getPublicUri, toShortDateString } from 'app/api/util'
import { usePermissions } from '../auth/hooks'
import { Error } from 'app/error'

const { useParam } = createParam<{ id: string }>()

/**
* Displays event info and a list of posts from that event
*/
export function EventScreen() {
  const [id] = useParam('id');
  const { data, refetch } = useGetEventQuery(Number(id));
  const { createHeader } = useSocietyHeader(data?.society);

  useEffect(createHeader);

  if (!data)
    return <Error />

  return (
    <ScrollView
      style={styles.eventWrapper}
      refreshControl={
        <RefreshControl refreshing={false} onRefresh={refetch} />
      }>
      <EventPageDraw data={data} />
      <View style={{
        marginTop: 20,
        flex: 1,
        alignItems: 'center',
        borderRadius: 15,
        paddingTop: 10,
        paddingHorizontal: 1,
        paddingBottom: 30,
        alignSelf: 'stretch',
        backgroundColor: 'white'
      }}>
        <Text style={{ fontSize: 32, margin: 0 }}>Posts</Text>
        <Text style={{ fontSize: 12, color: 'gray', marginTop: -5, marginBottom: 10 }}>Latest updates for this event</Text>
        <PostMap contentOnly event={data} />
      </View>
    </ScrollView >
  )
}

// RENDERER COMPONENT FOR ALL EVENT COMPONENT ELEMENTS
export default function EventPageDraw({ data }: {
  data: SocietyEvent
}) {
  const [canAddPost] = usePermissions(data.society.code, [
    "POST_CREATE"
  ])

  return (<>
    <View style={styles.eventContainer}>

      <View style={styles.entireTitleContainer}>
        {/* EVENT TITLE AND BUTTON RENDER*/}
        <View style={styles.titleAndButtonContainer}>
          <Text style={styles.eventTitle}>{data.title}</Text>
          <View><EventOptionsModal event={data} /></View>
        </View>
        {/* EVENT DATE RENDER */}
        <Text style={styles.eventDate}>
          {toShortDateString(data.startDate)} {`  to  `}
          {data.endDate && toShortDateString(data.endDate)}
        </Text>
      </View>

      <View>
        {data.attachments.map((image, key) =>
          <ScaledImage key={key} uri={getPublicUri(image)} />
        )}
      </View>
      <Text style={{ marginTop: 5 }}>{data.text}</Text>
      {/* EVENT INTERACTIVE BAR RENDER */}
      <EventInteractiveBar event={data} />
    </View>
    {
      canAddPost &&
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Button href={`/event/${data.id}/new-post`} text="New Post" size='full' />
      </View>
    }
  </>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    padding: 5,
    width: '100%',
    flex: 1,
  },
  postWrapper: {
    margin: 5,
    backgroundColor: '#E8E8E8',
    borderRadius: 20,
  },
  newPostButton: {
    flex: 1,
    margin: 5,
    padding: 5,
    backgroundColor: 'gainsboro',
  },
  eventContainer: {
    width: '100%',
    borderWidth: 0.5,
    paddingHorizontal: 5,
    borderRadius: 10,
    borderColor: 'gainsboro',
    marginVertical: 4,
  },
  contentContainer: {
    padding: 7,
  },

  titleBarContainer: {
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  entireTitleContainer: {
    padding: 10,
  },
  titleAndButtonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  eventTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    flex: 1,
  },
  buttonContainer: {
    borderColor: 'blue',
    flex: 1,
    justifyContent: 'center',
  },
  societyImage: {
    margin: 5,
    width: 50,
    height: 50,
    borderRadius: 50,
  },
  societyNameDateContainer: {
    flexDirection: 'column',
    alignItems: 'flex-start',
    justifyContent: 'flex-start',
  },
  societyName: {
    fontWeight: 'bold',
  },
  eventDate: {
    color: 'gray',
    fontSize: 12,
  },
})
