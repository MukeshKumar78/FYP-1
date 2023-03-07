import { createParam } from 'solito';
import { ScrollView, View, StyleSheet, TextInput } from 'react-native'
import CommentDraw from './comment-draw'
import { useAddCommentMutation, useListCommentsQuery, useRemoveCommentMutation } from './comment-api';
import { Text, Button, Hr } from 'app/components';
import { useState } from 'react';
import { useGetEventQuery } from '../event/event-api';
import useAuth, { usePermissions } from 'app/features/auth/useAuth'

const { useParam } = createParam<{ eventId: string }>()

/**
* 
*/
export function CommentScreen() {
  const [eventId] = useParam('eventId');


  if (!eventId || !Number(eventId))
    return <CommentScreenError />

  return <CommentView eventId={Number(eventId)}/>
}

function CommentView({ eventId }: {
  eventId: number
}) {

  const [addComment] = useAddCommentMutation();
  const [text, setText] = useState("");
  const { data: event } = useGetEventQuery(eventId);

  if(!event)
    return <CommentScreenError />

  return <View>
    <View style={styles.textContainer} >
      <TextInput
        style={styles.textInput}
        multiline={true}
        numberOfLines={2}
        placeholder='add a comment'
        onChangeText={(value) => setText(value)}
      />
    </View>
    <View style={{ alignItems: 'center' }}>
      <Button onPress={() => { 
        addComment({ event: eventId, text}).unwrap().catch(console.error)
      }} text="Comment" size='full' disabled={text.length < 3}/>
    </View>
    <Hr/>
    <CommentMap event={event} />
  </View>
}

function CommentMap({ event }: {
  event: SocietyEvent
}) {
  const { data } = useListCommentsQuery(event.id);
  const { user } = useAuth();
  const [remove] = useRemoveCommentMutation();
  const [canCreate, canDelete] = usePermissions(event.society.code, [
    'COMMENT_CREATE', 'COMMENT_DELETE'
  ]) 

  async function removeComment(id: number) {
    const res = await remove(id);
    console.log(res);
  }

  async function reportComment(id: number) {

  }

  return <ScrollView style={styles.commentWrapper}>
    {data?.map((comment, i) =>
      <CommentDraw 
        key={i} 
        comment={comment} 
        handleDelete={canDelete || comment.createdBy.code == user?.code 
          ? () => removeComment(comment.id)
          : undefined}
        handleReport={() => reportComment(comment.id)}
      />
    )}
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
    width: "100%",
  },
  textContainer: {
    marginVertical: 4,
    paddingVertical: 5,
    borderRadius: 10,
    justifyContent: 'flex-start',
  },
  textInput: {
    paddingVertical: 5,
    paddingHorizontal: 10,
    backgroundColor: 'white',
    borderRadius: 10,
    color: 'black',
  },
})
