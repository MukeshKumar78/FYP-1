import { createParam } from 'solito'
import { Error } from 'app/error'
import { useTextHeader } from 'app/hooks/headers'
import { useGetTeamQuery, useListMessagesQuery, useSendMessageMutation } from './team-api'
import { useEffect, useState } from 'react'
import { getPublicUri } from 'app/api/util';
import { Image, RefreshControl } from 'react-native'
import { ScrollView } from 'react-native'
import { View, Text, Button, AnimatedLink } from 'app/components'
import { Ionicons } from '@expo/vector-icons';
import { FormTextInput } from 'app/components/Form'
import { toShortDateString } from 'app/api/util'


const { useParam } = createParam<{ code: string }>()

export function TeamChatScreen() {
  const [code] = useParam('code')
  if (!code) return <Error />

  return <TeamChat code={code} />
}

function TeamChat({ code }: {
  code: string
}) {
  const { data: team, isLoading } = useGetTeamQuery(code)

  const { createHeader } = useTextHeader(code)
  useEffect(createHeader, [createHeader])

  if (!team)
    return isLoading ? <></> : <Error />

  return <TeamChatView team={team} />

}

function TeamChatView({ team }: {
  team: Team
}) {
  const [skip, setSkip] = useState(0);
  const [msg, setMsg] = useState("");
  const { data: messages } = useListMessagesQuery({
    team: team.code,
    skip: skip,
    size: 3
  })
  const [send] = useSendMessageMutation()
  const [refreshing, setRefreshing] = useState(false);

  function loadMore() {
    setSkip(messages?.data.length ?? 0);
  }

  function onRefresh() {
    setRefreshing(true);
    setSkip(0);
    setRefreshing(false);
  }

  let date: string = (new Date(0)).toDateString().slice(0, -5);

  return <View style={{ width: '100%' }}>
    <ScrollView
      refreshControl={
        <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
      }>
      <View style={{ marginVertical: 10, alignItems: 'center' }}>
        <Button type="outlined" text="Load more" onPress={loadMore} />
      </View>
      {messages?.data.map((msg, i) => {
        const mdate = toShortDateString(msg.createdAt)
        if (mdate !== date) {
          date = mdate;
          return <View key={i}>
            <Text style={{ color: 'gray', marginTop: 10, textAlign: 'center' }}>{mdate}</Text>
            <TeamChatBubble message={msg} />
          </View>
        }
        return <TeamChatBubble key={i} message={msg} />
      })}
    </ScrollView>
    <View style={{ flexDirection: 'row', alignItems: 'center' }}>
      <FormTextInput multiline style={{ flex: 1 }} placeholder="Send a chat..." label="" value={msg} onChangeText={setMsg} />
      <AnimatedLink onPress={() => {
        send({ team: team.code, msg })
        setMsg("")
      }}>
        <Ionicons name="send" size={18} />
      </AnimatedLink>
    </View>
  </View>
}

function TeamChatBubble({ message }: {
  message: TeamMessage
}) {
  return (
    <View>
      <View style={{ flexDirection: 'row', alignItems: 'center' }}>
        <AnimatedLink href={`/user/${message.sender.code}`}>
          <Image
            style={{ margin: 5, width: 40, height: 40, borderRadius: 50 }}
            source={{ uri: getPublicUri(message.sender.photo) }}
          />
        </AnimatedLink>
        <View style={{ flex: 1, borderRadius: 5, borderWidth: 1, padding: 5, margin: 5, borderColor: '#EFEFEF' }}>
          <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'space-between' }}>
            <Text style={{ fontSize: 16, fontWeight: 'bold' }}>{message.sender.firstName} {message.sender.lastName}</Text>
            <Text style={{ fontSize: 11, color: 'gray' }}>{(new Date(message.createdAt)).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}</Text>
          </View>
          <Text>{message.content}</Text>
        </View>
      </View>
    </View>
  )
}
