import { getPublicUri } from 'app/api/util';
import { ScrollView, View, StyleSheet } from 'react-native'
import { Image, Text } from 'react-native';

export default function SocietyHeader({ society }: {
  society: Pick<Society, 'name' | 'image'>
}) {
  return (
    <View style={styles.eventHeaderWrapper}>
      <Image
        style={styles.eventHeaderImage}
        source={{ uri: getPublicUri(society.image) }}
      />
      <Text style={styles.eventHeaderTitle}>{society.name}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  eventHeaderWrapper: {
    flexDirection: 'row',
    alignItems: 'center'
  },
  eventHeaderImage: {
    margin: 10,
    width: 40,
    height: 40,
    borderRadius: 50
  },
  eventHeaderTitle: {
    fontWeight: 'bold',
    fontSize: 20
  }
})
