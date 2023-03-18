import { ScaledImage } from 'app/components/ScaledImage'
import { Image, StyleSheet } from 'react-native'
import { InteractiveBar } from 'app/components/InteractiveBar'
import { getPublicUri, toTimeAndDateString } from 'app/api/util';
import { View, Text, AnimatedLink } from 'app/components'
import { Option, OptionsModalButton } from 'app/components/OptionsModalButton'
import { usePermissions } from '../auth/useAuth';
import { usePublishEventMutation } from './event-api';

/**
* Displays event with header, content and interactive bar sections
*/
export default function EventDraw({ event }: {
  event: SocietyEvent
}) {
  const [canPublish] = usePermissions(event.society.code, ["EVENT_PUBLISH"])
  const [publishEvent] = usePublishEventMutation();

  function publish() {
    publishEvent(event.id)
      .unwrap()
      .catch(console.error)
  }

  return (
    <View style={{ elevation: 2 }}>
      <View style={styles.eventContainer}>
        {/* TITLE BAR RENDER*/}
        <AnimatedLink href={`/society/${event.society.code}`}>
          <View style={styles.titleBarContainer}>
            <Image
              style={styles.societyImage}
              source={{ uri: getPublicUri(event.society.image) }}
            />

            <View style={styles.societyNameDateContainer}>
              {/* SOCIETY NAME */}
              <Text style={styles.societyName}>{event.society.name}</Text>

              {/* DATE COMPONENT */}
              <Text style={styles.eventDate}>
                {toTimeAndDateString(event.startDate)} {` - `}
                {event.endDate && toTimeAndDateString(event.endDate)}
              </Text>
            </View>
            <View style={styles.modalButton}>
              <OptionsModalButton>
                {
                  !event.published && canPublish &&
                  <Option text="Publish" onPress={publish} />
                }
              </OptionsModalButton>
            </View>
          </View>
        </AnimatedLink>

        {/* EVENT TITLE IMAGE CONTENT RENDER*/}
        <View style={styles.contentContainer}>
          <Text style={styles.eventTitle}>{event.title}</Text>
          <AnimatedLink href={`/event/${event.id}`}>
            {event.attachments.map((image, key) =>
              <ScaledImage uri={getPublicUri(image)} key={key} />
            )}
            <Text style={styles.eventText}>{event.text}</Text>
          </AnimatedLink>
        </View>

        {/* EVENT INTERACTIVE BAR RENDER*/}
        <InteractiveBar id={event.id} />
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  eventContainer: {
    marginVertical: 5,
    borderRadius: 8,
    borderWidth: 1,
    overflow: 'hidden',
    borderColor: 'gainsboro',
  },
  modalButton: {
    right: 0,
    position: 'absolute'
  },
  titleBarContainer: {
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  contentContainer: {
    padding: 3
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
  },
  eventTitle: {
    fontSize: 24,
    fontWeight: 'bold',
    padding: 10,
  },
  eventText: {
    padding: 4,
  },
})
