import { View, Image, StyleSheet, TouchableOpacity, TouchableWithoutFeedback } from 'react-native'
import Text from '../../components/Text'
import { Ionicons } from '@expo/vector-icons'
import PostContent from './post-content-draw'
import { getPublicUri } from 'app/api/util';
import { TextLink, Link } from 'solito/link';
import { AnimatedLink } from 'app/components/Button'

export default function PostDraw({ data, contentOnly = false }: {
  data: SocietyPost,
  contentOnly?: boolean
}) {
  return (
    <View style={styles.mainContainer}>
      {/* TITLE BAR RENDER*/}
      <View style={styles.titleBarContainer}>
        <AnimatedLink href={`/user/${data.createdBy.code}`}>
          <Image
            style={styles.societyImage}
            source={{ uri: getPublicUri(data.event.society.image) }}
          />
        </AnimatedLink>
        {/* User NAME */}
        <View>
          <Text style={styles.societyName}>{data.createdBy.firstName} {data.createdBy.lastName}</Text>
          <Text style={styles.postInfoText}>
            posted in <TextLink href={`/society/${data.event.society.code}`} >
              <Text style={{ color: '#6677cc', fontWeight: 'bold' }}>{data.event.society.fullName}
              </Text>
            </TextLink>
          </Text>
        </View>
      </View>

      {/* POST CONTENT RENDER */}
      <View style={styles.contentContainer}>
        <PostContent data={data} />
      </View>

      {!contentOnly &&
        <View style={styles.interactiveBarContainer}>
          <Text style={styles.interactiveBarText}>{data.event.title}</Text>
          <TouchableOpacity style={styles.redirectButton}>
            <Ionicons
              name="chevron-forward-sharp"
              {...interactiveButtonProps}
            />
          </TouchableOpacity>
        </View>
      }
      {/* POST INTERACTIVE BAR RENDER */}
    </View>
  )
}

const interactiveButtonProps = {
  size: 35,
  color: 'gray',
}

const styles = StyleSheet.create({
  mainContainer: {
    marginVertical: 5,
    borderRadius: 8,
    borderWidth: 1,
    overflow: 'hidden',
    borderColor: 'gainsboro',
  },

  titleBarContainer: {
    backgroundColor: '#EFEFEF',
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
    paddingHorizontal: '1.5%',
  },

  contentContainer: {
    padding: 3
  },

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
