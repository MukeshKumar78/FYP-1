import { StyleSheet, useWindowDimensions, Image, TextInput } from 'react-native';
import { View, Text, AnimatedLink } from "app/components";
import { Ionicons } from '@expo/vector-icons'
import { getPublicUri } from 'app/api/util';
import { useGetTeamMembershipsQuery } from "./team-api";
import { useAuth } from "../auth/hooks";

export function TeamChatsMapScreen() {
  const { user } = useAuth();
  const { data } = useGetTeamMembershipsQuery()

  const teams = data?.map(t => ({
    ...t,
    society: user?.memberships.find(m => m.society.code == t.team.society)
  }))

  return (
    <View style={{
      width: '100%',
      borderWidth: 1, borderColor: '#EFEFEF', borderRadius: 5,
    }}>
      {
        teams?.map((membership, i) =>
          <View key={i} style={{
            borderBottomWidth: 1, borderColor: 'white',
            backgroundColor: '#EFEFEF',
            shadowColor: 'gray', shadowOffset: { width: 0.1, height: 0.1 },
            flexDirection: 'row', padding: 7, margin: 0,
            justifyContent: 'space-between', alignItems: 'center'
          }}>
            <View style={{ flexDirection: 'row', alignItems: 'center' }}>
            <AnimatedLink href={`/society/${membership.society?.society.code}`}>
              <Image
                style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
                source={{ uri: getPublicUri(membership.society?.society.image) }}
              />
            </AnimatedLink>
            <View>
              <Text style={{ fontSize: 22 }}>{membership.team.name}</Text>
              <Text style={{ color: 'gray', fontSize: 14 }}>{membership.team.society}</Text>
            </View>
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


