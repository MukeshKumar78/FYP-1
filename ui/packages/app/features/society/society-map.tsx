import { ScaledImage } from 'app/components/ScaledImage'
import { View as DView } from 'dripsy'
import { Image, StyleSheet, ScrollView, View } from 'react-native'
import { ButtonWithChildren } from '../../components/Button'
import Text from '../../components/Text'
import { Ionicons } from '@expo/vector-icons'
import { SocietyInfoModule } from './society-info-draw'
import { EventMap } from '../event/event-map'

const DUMMY_SOCIETY = [
  {
    id: 'm1',
    Name: 'DECS',
    Image:
      'https://cdn.discordapp.com/attachments/1059750891512664084/1059788242448293928/307386157_6012211498808266_6769890018935496899_n.png',

    fullName: 'DRAMATICS AND EXTRA CIRICULAR SOCIETY',
    Description:
      'The most happening students committee of FAST-NU, the Dramatics and Extra-Curricular Society (DECS) has only one objective – fun!',
  },
]

export default function SocietyMap() {
  return (
    <ScrollView style={styles.mainContainer}>
      {/* SOCIETY DETAILS + EDIT + EVENT CREATE BUTTON */}
      {DUMMY_SOCIETY.map((society) => (
        <SocietyInfoModule
          id={society.id}
          societyName={society.Name}
          societyImage={society.Image}
          societyfullName={society.fullName}
          societyDescription={society.Description}
        />
      ))}

      {/* SOCIETY EVENTS + POSTS */}
      <EventMap />
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  mainContainer: {
    // borderWidth: 3,
    // borderColor: 'green',
    width: '100%',
    flex: 1,
  },
})
