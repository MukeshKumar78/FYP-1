import { View, Image, StyleSheet, Text, TouchableOpacity } from 'react-native'
import { OptionsModalButton, Option } from 'app/components/OptionsModalButton'
import { toShortDateString } from 'app/api/util';

export default function CommentDraw({ comment, handleDelete, handleReport }: {
  comment: EventComment
  handleDelete?: () => void
  handleReport?: () => void
}) {
  return (
      <View style={{ marginVertical: 10, flexDirection: 'row' }}>
        {/* IMAGE RENDER*/}
        <Image style={styles.userImage} source={{ uri: comment.createdBy.photo }} />

        <View style={{ flex: 1, flexDirection: 'column', alignItems: 'flex-start' }}>
          <Text style={styles.userName}>{comment.createdBy.firstName + ' ' + comment.createdBy.lastName}</Text>
          <Text style={styles.commentDate}>
            {toShortDateString(comment.createdAt)}
          </Text>

          <View >
            <Text>{comment.text}</Text>
          </View>
        </View>

        <OptionsModalButton style={{ position: 'absolute', right: 5 }}>
          {handleDelete && <Option text="Delete" onPress={handleDelete} />}
          {handleReport && <Option text="Report" onPress={handleReport} />}
        </OptionsModalButton>
      </View>
  )
}

const styles = StyleSheet.create({
  userImage: {
    margin: 5,
    width: 40,
    height: 40,
    borderRadius: 50,
  },
  userName: {
    fontWeight: '800',
    fontSize: 15,
  },
  commentDate: {
    color: 'gray',
    fontSize: 11,
  },
})
