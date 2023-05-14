import { Image, StyleSheet, TouchableOpacity, Share, Platform } from 'react-native'
import { Ionicons } from '@expo/vector-icons'
import { Link } from 'solito/link'
import { View, Text, AnimatedLink } from 'app/components'
import { ScaledImage } from 'app/components/ScaledImage'
import EventOptionsModal from './event-options-modal';
import { getPublicUri, toTimeAndDateString } from 'app/api/util';
import { useReactMutation } from './event-api'
import * as Clipboard from 'expo-clipboard';
import Toast from 'react-native-toast-message';
import { useState } from 'react'

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

        <EventHeader event={event} />

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
              {toTimeAndDateString(event.startDate)}
              {event.endDate && ' - ' + toTimeAndDateString(event.endDate)}
            </Text>
          </View>
        </View>
      </AnimatedLink>
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
  const [react, data] = useReactMutation()
  const [reactDisabled, setReactDisabled] = useState(false)

  async function onReact() {
    setReactDisabled(true)
    await react(event.id)
    setReactDisabled(false)
  }

  return (
    <View style={styles.interactiveBarContainer}>
      <InteractiveIcon icon={
        <Ionicons name={event.reacted ? "star-sharp" : "star-outline"} size={iconSize} color="#FFD700" />
      }
        onPress={onReact}
        disabled={reactDisabled}
        text={event.totalReacts || ''}
        size={iconSize} />

      <InteractiveIcon icon={
        <Ionicons name="chatbox-outline" size={iconSize} color="gray" />
      }
        href={`/event/${event.id}/comments`}
        text={event.totalComments || ''}
        size={iconSize} />

      <InteractiveIcon icon={
        <Ionicons name="share-social-outline" size={iconSize} color="lightblue" />
      }
        onPress={async () => {
          if (Platform.OS === 'android') {
            await Share.share({
              message: `${event.title}
https://campusme.tech/event/${event.id}`,
            })
          } else {
            await Clipboard.setStringAsync(`https://campusme.tech/event/${event.id}`)
            Toast.show({ type: 'success', text1: 'Link copied to clipboard' })
          }
        }}
        size={iconSize} />
    </View>
  )
}

function InteractiveIcon({ disabled = false, icon, text = '', onPress, href }: {
  onPress?: () => void,
  href?: string,
  icon: JSX.Element,
  disabled?: boolean,
  text?: string | number,
  size: number
}) {

  const iconButton =
    <View style={{ flexDirection: 'row', paddingVertical: 8, justifyContent: 'center', alignItems: 'center', borderColor: '#e7e7e7', borderWidth: 0, borderRadius: 5 }}>
      {icon}<Text style={{ color: 'gray', fontSize: 12 }}>{Number(text) ? nFormatter(Number(text), 3) : ""}</Text>
    </View>


  return (
    <View style={{ flex: 1 }}>
      {href
        ? <Link href={href}>{iconButton}</Link>
        : <TouchableOpacity disabled={disabled} onPress={onPress} activeOpacity={0.7}>{iconButton}</TouchableOpacity>
      }
    </View>
  )
}

function nFormatter(num: number, digits: number) {
  const lookup = [
    { value: 1, symbol: "" },
    { value: 1e3, symbol: "k" },
    { value: 1e6, symbol: "M" },
    { value: 1e9, symbol: "G" },
    { value: 1e12, symbol: "T" },
    { value: 1e15, symbol: "P" },
    { value: 1e18, symbol: "E" }
  ];
  const rx = /\.0+$|(\.[0-9]*[1-9])0+$/;
  var item = lookup.slice().reverse().find(function(item) {
    return num >= item.value;
  });
  return item ? (num / item.value).toFixed(digits).replace(rx, "$1") + item.symbol : "0";
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
