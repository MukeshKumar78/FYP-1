import { ScrollView, View, StyleSheet } from 'react-native'
import { useEffect } from 'react'
import Text from '../../components/Text'
import { Button } from '../../components/Button'
import { PostMap } from '../post/post-map'
import { ScaledImage } from 'app/components/ScaledImage'
import EventOptionsModal from './event-options-modal'
import Dater from 'app/components/DateRender'
import { InteractiveBar } from 'app/components/InteractiveBar'
import { useGetEventQuery } from './event-api';
import { useSocietyHeader } from 'app/hooks/headers';
import { createParam } from 'solito';
import { getPublicUri } from 'app/api/util'

const { useParam } = createParam<{ id: string }>()

/**
* Displays event info and a list of posts from that event
*/
export function EventScreen() {
  const [id] = useParam('id');
  const { data } = useGetEventQuery(Number(id));
  const { createHeader } = useSocietyHeader(data?.society);

  useEffect(createHeader);


  if (!data)
    return <EventScreenError />

  return (
    <ScrollView style={styles.eventWrapper}>
      <EventPageDraw data={data} />
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Button href={`/event/${id}/new-post`} text="New Post" size='full' />
      </View>
      <View style={{
        marginTop: 20,
        flex: 1,
        alignItems: 'center',
        borderRadius: 15,
        paddingTop: 10,
        paddingHorizontal: 1,
        elevation: 5,
        paddingBottom: 30,
        alignSelf: 'stretch',
        backgroundColor: 'white',
      }}>
        <Text style={{ fontSize: 32, margin: 0 }}>Posts</Text>
        <Text style={{ fontSize: 12, color: 'gray', marginTop: -5, marginBottom: 10 }}>Latest updates for this event</Text>
      <PostMap contentOnly event={data} />
      </View>
    </ScrollView >
  )
}

// RENDERER COMPONENT FOR ALL EVENT COMPONENT ELEMENTS
export default function EventPageDraw(props: { data: SocietyEvent }) {
  const data = props.data

  return (
    <View style={styles.eventContainer}>
      {/* EVENT TITLE IMAGE CONTENT RENDER*/}
        <View style={styles.entireTitleContainer}>
          {/* EVENT TITLE AND BUTTON RENDER*/}
          <View style={styles.titleAndButtonContainer}>
            <Text style={styles.eventTitle}>{data.title}</Text>
            <View style={styles.buttonContainer}>
              <EventOptionsModal style={styles.eventOptionButton} />
            </View>
          </View>
          {/* EVENT DATE RENDER */}
          <Text style={styles.eventDate}>
            <Dater date={data.startDate} /> {`  to  `}
            {data.endDate && <Dater date={data.endDate} />}
          </Text>
        </View>

        {/* TODO: make a slideshow component for images */}
        <View>
          {data.attachments.map((image, key) =>
            <ScaledImage key={key} uri={getPublicUri(image)} />
          )}
        </View>
        <Text style={styles.eventText}>{data.text}</Text>

      {/* EVENT INTERACTIVE BAR RENDER */}
      <InteractiveBar id={data.id} />
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
    //borderWidth: 2,
    padding: 10,
  },

  titleAndButtonContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    //alignItems: 'center',
    //borderWidth: 2,
    borderColor: 'red',
  },

  eventTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    flex: 11,
    //borderWidth: 1,
  },

  buttonContainer: {
    //borderWidth: 2,
    borderColor: 'blue',
    flex: 1,
    justifyContent: 'center',
  },

  eventOptionButton: {
    //borderWidth: 2,
    aspectRatio: 1,
    alignSelf: 'center',
    paddingTop: 5,
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

  eventText: {
    //padding: 4,
  },
})
