import { ScaledImage } from 'app/components/ScaledImage'
import { View as DView } from 'dripsy'
import { Image, StyleSheet } from 'react-native'
import { ButtonWithChildren } from '../../components/Button'
import Text from '../../components/Text'
import EventOptionsModal from './event-options-modal'
import { Ionicons } from '@expo/vector-icons'
import Dater from 'app/components/DateRender'

// RENDERER COMPONENT FOR ALL EVENT COMPONENT ELEMENTS
export default function EventDetails(props: { data: SocietyEvent }) {
  const data = props.data
  //console.log(props.data)

  function ratingHandler() {}

  function commentsHandler() {}

  function shareHandler() {}

  return (
    <DView style={styles.eventContainer}>
      {/* TITLE BAR RENDER*/}
      <DView style={styles.titleBarContainer}>
        <Image
          style={styles.societyImage}
          source={{ uri: data.society.image }}
        />

        <DView style={styles.societyNameDateContainer}>
          {/* SOCIETY NAME */}
          <Text style={styles.societyName}>{data.society.title}</Text>

          {/* DATE COMPONENT */}
          <Text style={styles.eventDate}>
            <Dater date={data.startDate} /> {`\t`}
            <Dater date={data.endDate} />
          </Text>
        </DView>
        <EventOptionsModal style={styles.eventOptionButton} />
      </DView>

      {/* EVENT TITLE IMAGE CONTENT RENDER*/}
      <DView style={styles.contentContainer}>
        <Text style={styles.eventTitle}>{data.title}</Text>
        <ScaledImage uri={data.image} />
        <Text style={styles.eventText}>{data.text}</Text>
      </DView>

      {/* EVENT INTERACTIVE BAR RENDER*/}
      <DView style={styles.interactiveBarContainer}>
        <ButtonWithChildren
          style={styles.buttons}
          onPress={() => {
            ratingHandler
          }}
        >
          <Ionicons name="star" {...interactiveButtonProps} />
        </ButtonWithChildren>

        <ButtonWithChildren style={styles.buttons} onPress={() => {}}>
          <Ionicons name="chatbox" {...interactiveButtonProps} />
        </ButtonWithChildren>

        <ButtonWithChildren
          style={styles.buttons}
          onPress={() => {
            shareHandler
          }}
        >
          <Ionicons name="share" {...interactiveButtonProps} />
        </ButtonWithChildren>
      </DView>
    </DView>
  )
}

const interactiveButtonProps = {
  size: 20,
  color: 'gray',
}

const styles = StyleSheet.create({
  eventContainer: {
    width: '100%',
    borderWidth: 0.5,
    borderRadius: 10,
    borderColor: 'gainsboro',
    backgroundColor: '$background',
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

  contentContainer: {
    padding: 7,
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
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    flex: 1,
  },

  buttons: {
    backgroundColor: '#EFEFEF',
  },
})
