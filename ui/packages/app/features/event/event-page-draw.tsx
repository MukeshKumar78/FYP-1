import { ScaledImage } from 'app/components/ScaledImage'
import { View as DView } from 'dripsy'
import { Image, StyleSheet, View } from 'react-native'
import { ButtonWithChildren } from '../../components/Button'
import Text from '../../components/Text'
import EventOptionsModal from './event-options-modal'
import { Ionicons } from '@expo/vector-icons'
import Dater from 'app/components/DateRender'
import { InteractiveBar } from 'app/components/Interactive-Bar'

// RENDERER COMPONENT FOR ALL EVENT COMPONENT ELEMENTS
export default function EventPageDraw(props: { data: SocietyEvent }) {
  const data = props.data
  //console.log(props.data)

  return (
    <DView style={styles.eventContainer}>
      {/* EVENT TITLE IMAGE CONTENT RENDER*/}
      <DView style={styles.contentContainer}>
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
            <Dater date={data.endDate} />
          </Text>
        </View>

        {/* EVENT IMAGE AND TEXT RENDER */}
        <ScaledImage uri={data.image} />
        <Text style={styles.eventText}>{data.text}</Text>
      </DView>

      {/* EVENT INTERACTIVE BAR RENDER */}
      <InteractiveBar id={data.id} />
    </DView>
  )
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
