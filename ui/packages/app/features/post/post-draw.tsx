import { View, Image, StyleSheet, TouchableOpacity } from 'react-native'
import Text from '../../components/Text'
import { Ionicons } from '@expo/vector-icons'
import PostContent from './post-content-draw'

export default function PostDraw({ data }: {
  data: SocietyPost
}) {
  return (
    <View style={styles.mainContainer}>
      {/* TITLE BAR RENDER*/}
      <View style={styles.titleBarContainer}>
        <Image
          style={styles.societyImage}
          source={{ uri: data.event.society.image }}
        />
        {/* SOCIETY NAME */}
        <Text style={styles.societyName}>{data.event.society.name}</Text>
        <Text style={styles.postInfoText}> {` posted an update`}</Text>
      </View>

      {/* POST CONTENT RENDER */}
      <View style={styles.contentContainer}>
        <PostContent post={data} />
      </View>

      {/* POST INTERACTIVE BAR RENDER */}
      <View style={styles.interactiveBarContainer}>
        <Text style={styles.interactiveBarText}>{data.event.title}</Text>
        <TouchableOpacity style={styles.redirectButton}>
          <Ionicons
            name="chevron-forward-sharp"
            {...interactiveButtonProps}
          />
        </TouchableOpacity>
      </View>
    </View>
  )
}

const interactiveButtonProps = {
  size: 35,
  color: 'gray',
}

const styles = StyleSheet.create({
  mainContainer: {},

  titleBarContainer: {
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
    paddingHorizontal: '1.5%',
  },

  contentContainer: {},

  societyImage: {
    margin: 5,
    width: 50,
    height: 50,
    borderRadius: 50,
  },

  societyName: {
    fontWeight: 'bold',
  },

  postInfoText: {
    color: 'grey',
    fontSize: 12,
  },

  interactiveBarContainer: {
    flex: 1,
    //backgroundColor: 'red',
    //borderWidth: 1,
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 8,
  },
  interactiveBarText: {
    paddingVertical: 12,
    fontSize: 15,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
    color: '#505050',
  },
  redirectButton: {
    //borderWidth: 2,
    justifyContent: 'center',
  },
})
