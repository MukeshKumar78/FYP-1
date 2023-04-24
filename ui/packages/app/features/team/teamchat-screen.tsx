import { createParam } from 'solito'
import { Error } from 'app/error'
import { useTextHeader } from 'app/hooks/headers'
import { useGetTeamQuery, useListMessagesQuery, useSendMessageMutation } from './team-api'
import { useEffect, useState } from 'react'
import { ScrollView } from 'react-native'
import { View, Text, Button } from 'app/components'
import { FormSubmitButton, FormTextInput } from 'app/components/Form'


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


  function loadMore() {
    setSkip(messages?.data.length ?? 0);
  }

  return <View style={{ width: '100%' }}>
    <ScrollView>
      <View style={{ marginVertical: 10, alignItems: 'center' }}>
        <Button type="outlined" text="Load more" onPress={loadMore} />
      </View>
      {messages?.data.map((msg, i) => (
        <Text key={i}>{`${msg.sender.firstName}: ${msg.content}    ${msg.createdAt}`}</Text>
      ))}
    </ScrollView>
    <FormTextInput label="" value={msg} onChangeText={setMsg} />
    <FormSubmitButton label="Send" onPress={() => {
      send({ team: team.code, msg })
    }} />
  </View>

}
