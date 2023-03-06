import { createParam } from 'solito';
import { ScrollView, View, StyleSheet, TextInput } from 'react-native'
import CommentDraw from './comment-draw'
import { Text } from 'react-native';
import { useListCommentsQuery } from './comment-api';

const { useParam } = createParam<{ eventId: string }>()

/**
* 
*/
export function CommentScreen() {
  const [eventId] = useParam('eventId');

  if(!eventId || !Number(eventId))
    return <CommentScreenError/>

  return <View>
    <TextInput/>
    <CommentMap eventId={Number(eventId)}/>
  </View>
}

function CommentMap({ eventId }: {
  eventId: number
}) {
  const { data } = useListCommentsQuery(eventId);

  return <ScrollView style={styles.commentWrapper}>
    {data?.map((comment, i) =>
      <CommentDraw
        key={i}
        comment={comment}
      />)}
  </ScrollView>

}


function CommentScreenError() {
  return <View>
    <Text>
      Failed to load screen
    </Text>
  </View>
}

const styles = StyleSheet.create({
  commentWrapper: {
    marginTop: 50,
    width: "100%",
    flex: 1,
  },
})
