import { createParam } from 'solito';
import { RefreshControl, ScrollView, StyleSheet, TextInput } from 'react-native'
import CommentDraw from './comment-draw'
import { useAddCommentMutation, useListCommentsQuery, useRemoveCommentMutation } from './comment-api';
import { Text, View, Button, Hr } from 'app/components';
import { useState } from 'react';
import { useGetEventQuery } from '../event/event-api';
import { useAuth, usePermissions } from 'app/features/auth/hooks'
import { FormTextInput } from 'app/components/Form';
import { Error } from 'app/error';

// Event ID param: e.g. /event/1/comments
const { useParam } = createParam<{ id: string }>()

/**
*
*/
export function CommentScreen() {
  const [id] = useParam('id');


  if (!id || !Number(id))
    return <Error />

  return <CommentView eventId={Number(id)} />
}

function CommentView({ eventId }: {
  eventId: number
}) {

  const [addComment, { isLoading }] = useAddCommentMutation();
  const [disabled, setDisabled] = useState(false)
  const [text, setText] = useState("");
  const { data: event } = useGetEventQuery(eventId);

  if (!event)
    return <Error />

  async function onSubmit() {
    setDisabled(true)
    setText("");
    await addComment({ event: eventId, text })
    setDisabled(false)
  }

  return <View style={{ padding: 5, width: '100%', maxHeight: '100%' }}>
    <View style={styles.textContainer} >
      <FormTextInput
        label=""
        style={styles.textInput}
        value={text}
        disabled={disabled}
        multiline={true}
        placeholder='add a comment'
        onChangeText={(value) => setText(value)}
      />
    </View>
    <View style={{ alignItems: 'center' }}>
      <Button onPress={onSubmit}
        text="Comment" style={{ width: '100%' }} disabled={text.length < 3} />
    </View>
    <Hr />
    <CommentMap event={event} />
  </View>
}

function CommentMap({ event }: {
  event: SocietyEvent
}) {
  const [page, setPage] = useState(0);

  const { data, refetch } = useListCommentsQuery({
    event: event.id,
    page,
    size: 10
  });

  const { user } = useAuth();
  const [remove] = useRemoveCommentMutation();
  const [canCreate, canDelete] = usePermissions(event.society.code, [
    'COMMENT_CREATE', 'COMMENT_DELETE'
  ])

  async function removeComment(id: number) {
    const res = await remove(id);
  }

  function onRefresh() {
    setPage(0);
    refetch();
  }

  function loadMore() {
    setPage(page => page + 1);
  }

  return <ScrollView
    style={styles.commentWrapper}
    refreshControl={
      <RefreshControl refreshing={false} onRefresh={onRefresh} />
    }>
    {data?.data.map((comment, i) =>
      <CommentDraw
        key={i}
        comment={comment}
        handleDelete={canDelete || comment.createdBy.code == user?.code
          ? () => removeComment(comment.id)
          : undefined}
      />
    )}
    <View style={{ marginVertical: 10, alignItems: 'center' }}>
      <Button type="outlined" text="Load more" onPress={loadMore} />
    </View>
  </ScrollView>
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
    borderRadius: 3,
    marginVertical: 5,
    minHeight: 0,
    color: 'black',
    borderColor: 'gainsboro',
    borderWidth: 1
  },
})
