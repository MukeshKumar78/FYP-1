import { View, StyleSheet, Text } from 'react-native'
import { ScaledImage } from 'app/components/ScaledImage'

export default function PostContent({ data } : {
  data: SocietyPost
}) {
  return (
    <View style={styles.mainContainer}>
      <Text style={styles.postTitle}>{data.title}</Text>
      <ScaledImage uri={data.image} />
      <Text style={styles.postText}>{data.text}</Text>
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
  postText: {
    paddingHorizontal: 4,
    paddingVertical: 10,
  },
})
