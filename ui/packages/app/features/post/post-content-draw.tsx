import { View, StyleSheet, Text } from 'react-native'
import { ScaledImage } from 'app/components/ScaledImage'
import { getPublicUri } from 'app/api/util'

export default function PostContentDraw({ data } : {
  data: SocietyPost
}) {
  return (
    <View style={styles.mainContainer}>
      <Text style={styles.postTitle}>{data.title}</Text>
        {data.attachments.map((image, key) => 
          <ScaledImage uri={getPublicUri(image)} key={key} />
        )}
      <Text style={styles.postText}>{data.text}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  mainContainer: {},
  postTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    paddingVertical: 10,
    marginHorizontal: 5
  },
  postText: {
    paddingVertical: 10,
    marginHorizontal: 5
  },
})
