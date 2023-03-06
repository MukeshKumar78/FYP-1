import { ScaledImage } from 'app/components/ScaledImage'
import { View, Image, StyleSheet } from 'react-native'
import Text from '../../components/Text'
import EventOptionsModal from './event-options-modal'
import Dater from 'app/components/DateRender'
import { InteractiveBar } from 'app/components/InteractiveBar'
import { Link } from 'solito/link'
import { getPublicUri } from 'app/api/util';
import { AnimatedLink } from 'app/components/Button'

/**
* Displays event with header, content and interactive bar sections
*/
export default function EventDraw({ event }: {
  event: SocietyEvent
}) {

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
                <Dater date={event.startDate} /> {`\t`}
                {event.endDate && <Dater date={event.endDate} />}
              </Text>
            </View>
            <EventOptionsModal style={styles.eventOptionButton} />
          </View>
        </AnimatedLink>

        {/* EVENT TITLE IMAGE CONTENT RENDER*/}
        <View style={{}}>
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
    width: '100%',
    paddingHorizontal: 3,
    marginVertical: 4,
  },

  titleBarContainer: {
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
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
  eventOptionButton: {
    right: 10,
    position: 'absolute',
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
