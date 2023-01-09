import { View, StyleSheet, Text } from 'react-native'
import { ScaledImage } from 'app/components/ScaledImage'

export default function PostContent(props) {
  return (
    <View style={styles.mainContainer}>
      <Text style={styles.postTitle}>{props.title}</Text>
      <ScaledImage uri={props.image} />
      <Text style={styles.eventText}>{props.text}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  mainContainer: {},
  postTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    padding: 10,
  },
  eventText: {
    paddingHorizontal: 4,
    paddingVertical: 10,
  },
})
