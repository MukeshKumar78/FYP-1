import { Image, StyleSheet, TouchableOpacity } from 'react-native'
import { Ionicons } from '@expo/vector-icons'
import { Link } from 'solito/link'
import { View, Text, AnimatedLink } from 'app/components'
import { ScaledImage } from 'app/components/ScaledImage'
import EventOptionsModal from './event-options-modal';
import { getPublicUri, toTimeAndDateString } from 'app/api/util';

const iconSize = 20;

/**
* Displays event with header, content and interactive bar sections
*/
export default function EventDraw({ event }: {
  event: SocietyEvent
}) {
  return (
    <View style={{ elevation: 2 }}>
      <View style={styles.eventContainer}>

        <AnimatedLink href={`/society/${event.society.code}`}>
          <EventHeader event={event} />
        </AnimatedLink>

        <AnimatedLink href={`/event/${event.id}`}>
          <EventContent event={event} />
        </AnimatedLink>

        <EventInteractiveBar event={event} />

      </View>
    </View>
  )
}

export function EventHeader({ event }: {
  event: SocietyEvent
}) {
  return (
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
        <EventOptionsModal event={event} />
      </View>
    </View>
  )
}


export function EventContent({ event }: {
  event: SocietyEvent
}) {
  return (
    <View style={styles.contentContainer}>
      <Text style={styles.eventTitle}>{event.title}</Text>
      {event.attachments.map((image, key) =>
        <ScaledImage uri={getPublicUri(image)} key={key} />
      )}
      <Text style={styles.eventText}>{event.text}</Text>
    </View>
  )
}

export function EventInteractiveBar({ event }: {
  event: SocietyEvent
}) {
  return (
    <View style={styles.interactiveBarContainer}>
      <InteractiveIcon icon={
        <Ionicons name="star-outline" size={iconSize} color="#FFD700" />
      }
        onPress={() => { }}
        size={iconSize} />

      <InteractiveIcon icon={
        <Ionicons name="chatbox-outline" size={iconSize} color="gray" />
      }
        href={`/event/${event.id}/comments`}
        size={iconSize} />

      <InteractiveIcon icon={
        <Ionicons name="share-social-outline" size={iconSize} color="lightblue" />
      }
        onPress={() => { }}
        size={iconSize} />
    </View>
  )
}

function InteractiveIcon({ icon, onPress, href }: {
  onPress?: () => void,
  href?: string,
  icon: JSX.Element,
  size: number
}) {

  const iconButton =
    <View style={{ paddingVertical: 8, alignItems: 'center', borderColor: '#e7e7e7', borderWidth: 0, borderRadius: 5 }}>
      {icon}
    </View>


  return (
    <View style={{ flex: 1 }}>
      {href
        ? <Link href={href}>{iconButton}</Link>
        : <TouchableOpacity onPress={onPress} activeOpacity={0.7}>{iconButton}</TouchableOpacity>
      }
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
  interactiveBarContainer: {
    flex: 1,
    flexDirection: 'row',
  },
  interactiveButtons: {
    backgroundColor: '#EFEFEF',
  },
})
