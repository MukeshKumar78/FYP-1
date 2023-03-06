import { View, StyleSheet, TouchableOpacity, Dimensions } from 'react-native'
import { Ionicons  } from '@expo/vector-icons'
import { Link } from 'solito/link'

const width = Dimensions.get('window').width
const btnWidth = width / 3;
const iconSize = 20;

export function InteractiveBar({ id }: {
  id: number
}) {

  return (
    <View style={styles.interactiveBarContainer}>
      <InteractiveIcon icon={<Ionicons name="star-outline" size={iconSize} color="#FFD700" />} onPress={() => { }} width={btnWidth} size={iconSize} />
      <InteractiveIcon icon={<Ionicons name="chatbox-outline" size={iconSize} color="gray"/>} href={`/event/${id}/comments`} width={btnWidth} size={iconSize} />
      <InteractiveIcon icon={<Ionicons name="share-social-outline" size={iconSize} color="lightblue" />} onPress={() => { }} width={btnWidth} size={iconSize} />
    </View>
  )
}

function InteractiveIcon({ icon, onPress, href, width }: {
  onPress?: () => void,
  href?: string,
  width: number,
  icon: JSX.Element,
  size: number
}) {

  const iconButton =
    <View style={{ width, paddingVertical: 8, alignItems: 'center', borderColor: '#e7e7e7', borderWidth: 0, borderRadius: 5 }}>
      {icon}
    </View>


  return (
    <>
      {href
        ? <Link href={href}>{iconButton}</Link>
        : <TouchableOpacity onPress={onPress} activeOpacity={0.7}>{iconButton}</TouchableOpacity>
      }
    </>
  )
}

const styles = StyleSheet.create({
  interactiveBarContainer: {
    flex: 1,
    flexDirection: 'row',
  },

  buttons: {
    backgroundColor: '#EFEFEF',
  },
})
