import { useNavigation } from '@react-navigation/native';
import { getPublicUri } from 'app/api/util';
import { View, StyleSheet } from 'react-native'
import { Image, Text } from 'react-native';

function SocietyHeader({ society }: {
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


export function useSocietyHeader(society: Society | undefined) {

  const navigation = useNavigation();

  function createHeader() {
    if (society)
      navigation.setOptions({ headerTitle: () => <SocietyHeader society={society} /> })
  }

  return { createHeader }
}

export function useUserHeader(user: User | undefined) {
  const navigation = useNavigation();

  function createHeader() {
    if (user)
      navigation.setOptions({ title: user.firstName + ' ' + user.lastName })
  }

  return { createHeader }
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
