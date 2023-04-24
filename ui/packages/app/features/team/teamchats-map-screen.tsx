import { View, Text, AnimatedLink } from "app/components";
import { Ionicons } from '@expo/vector-icons'
import { useGetTeamMembershipsQuery } from "./team-api";

export function TeamChatsMapScreen() {
  const { data } = useGetTeamMembershipsQuery()

  return (
    <View style={{
      width: '100%',
      borderWidth: 1, borderColor: '#EFEFEF', borderRadius: 5,
    }}>
      {
        data?.map((membership, i) =>
          <View key={i} style={{
            borderBottomWidth: 1, borderColor: 'white',
            backgroundColor: '#EFEFEF',
            shadowColor: 'gray', shadowOffset: { width: 0.1, height: 0.1 },
            flexDirection: 'row', padding: 7, margin: 0,
            justifyContent: 'space-between', alignItems: 'center'
          }}>
            <View>
              <Text style={{ fontSize: 22 }}>{membership.team.name}</Text>
              <Text style={{ color: 'gray', fontSize: 14 }}>{membership.team.society}</Text>
            </View>
            <AnimatedLink href={`/team/chats/${membership.team.code}`}>
              <Ionicons name='md-chatbox-ellipses-outline' size={26} color="gray" />
            </AnimatedLink>
          </View>
        )
      }
    </View>
  )
}


