import { View, Image, StyleSheet, Text, TouchableOpacity } from 'react-native'
import { OptionsModalButton, Option } from 'app/components/OptionsModalButton'
import { toShortDateString } from 'app/api/util';

export default function CommentDraw({ comment, handleDelete, handleReport }: {
  comment: EventComment
  handleDelete?: () => void
  handleReport?: () => void 
}) {
  return (
    <View style={styles.featureContainer}>
      {/* IMAGE RENDER*/}
      <Image style={styles.userImage} source={{ uri: comment.createdBy.photo }} />

      {/* USER NAME AND TEXT CONTAINER*/}
      <View style={styles.nameCommentContainer}>
        {/* USER NAME / DATE / OPTIONS BUTTON CONTAINER*/}
        <View style={styles.nameDateOptionContainer}>
          {/* USER NAME / DATE  CONTAINER*/}
          <View style={styles.nameDateContainer}>
            <Text style={styles.userName}>{comment.createdBy.firstName + ' ' + comment.createdBy.lastName}</Text>
            <Text style={styles.commentDate}>
              {toShortDateString(comment.createdAt)}
            </Text>
          </View>

          <OptionsModalButton>
              {handleDelete && <Option text="Delete" onPress={handleDelete}/>}
              {handleReport && <Option text="Report" onPress={handleReport}/>}
          </OptionsModalButton>
        </View>

        {/* COMMENT TEXT */}
        <View style={styles.textContainer}>
          <Text style={styles.commentText}>{comment.text}</Text>
        </View>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  featureContainer: {
    marginVertical: 2,
    paddingVertical: '2%',
    borderWidth: 0,
    borderColor: 'black',
    borderRadius: 10,
    width: '100%',
    flexDirection: 'row',
    backgroundColor: '#EFEFEF',
  },

  nameCommentContainer: {
    borderWidth: 0,
    borderColor: 'green',
    alignItems: 'flex-start',
    width: '100%',
  },

  userImage: {
    margin: 5,
    width: 40,
    height: 40,
    borderRadius: 50,
  },
  nameDateContainer: {
    flexDirection: 'row',
  },

  nameDateOptionContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    width: '100%',
    paddingRight: '17%',
  },
  userName: {
    fontWeight: '800',
    fontSize: 15,
    marginRight: '5%',
  },

  commentDate: {
    color: 'gray',
    fontSize: 11,
    alignSelf: 'center',
  },

  optionButton: {
    borderWidth: 1,
    height: 15,
    width: 15,
  },

  textContainer: {
    width: '83%',
    borderColor: 'blue',
  },

  commentText: {},
})
