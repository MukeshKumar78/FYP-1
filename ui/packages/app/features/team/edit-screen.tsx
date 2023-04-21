import { createParam } from 'solito';
import { StyleSheet, useWindowDimensions, Image, TextInput } from 'react-native';
import React, { useEffect, useState } from 'react';
import { useGetTeamsBySocietyQuery, useAddTeamMutation, useRemoveTeamMutation, useGetTeamMembershipsQuery, useAddTeamMemberMutation, useRemoveTeamMemberMutation, useGetTeamQuery } from 'app/features/team/team-api';
import { useSocietyHeader } from '../../hooks/headers'
import { TabView, SceneMap, TabBar } from 'react-native-tab-view';
import { getPublicUri } from 'app/api/util';
import { Option, OptionsModalButton } from 'app/components/OptionsModalButton';
import { usePermissions } from '../auth/hooks';
import { Text, Button, View } from 'app/components';
import { Form, FormDateInput, FormImagePicker, FormSubmitButton, FormTextInput } from 'app/components/Form';
import DropDownPicker from 'react-native-dropdown-picker'
import Toast from 'react-native-toast-message';

function MembersRoute({ team }: {
  team: Team
}) {
  const { data } = useGetTeamMembershipsQuery(team.code);
  const [canAdd, canRemove, canEdit] = usePermissions(team.society, [
    "TEAM_MEMBER_ADD",
    "TEAM_MEMBER_REMOVE",
    "TEAM_MEMBER_UPDATE"
  ])

  const [remove] = useRemoveTeamMemberMutation();

  function removeMember(member: TeamMember) {
    remove({
      team: member.team.code,
      user: member.user.code
    })
  }

  return <View style={{
    flex: 1,
    margin: 5,

  }}>
    <View style={{ zIndex: -100 }}>
      {
        canAdd &&
        <AddMemberView team={team.code} />
      }
      {data?.map((membership, i) =>
        <View key={i} style={{ flexDirection: 'row', alignItems: 'center', zIndex: -1 }}>
          <Image
            style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
            source={{ uri: getPublicUri(membership.user.photo) }}
          />
          <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
            <View>
              <Text>{membership.user.firstName} {membership.user.lastName}</Text>
              <Text style={{ color: 'gray', fontSize: 12 }}>{membership.user.code}</Text>
            </View>
          </View>
          {
            canRemove && <OptionsModalButton>
              <Option text="Remove" onPress={() => removeMember(membership)} />
            </OptionsModalButton>
          }
        </View>
      )
      }
    </View >
  </View>
}


function AddMemberView({ team }: {
  team: string
}) {
  const [user, setUser] = useState("");
  const [addMember] = useAddTeamMemberMutation();

  function submit() {
    addMember({
      team,
      user: user,
    })
  }

  function isValid() {
    return true
  }

  return <View style={{ borderWidth: 1, borderColor: 'gainsboro', borderRadius: 5, padding: 10 }}>
    <View style={{}} >
      <View style={styles.labelContainer}>
        <Text style={styles.label}>Email</Text>
      </View>
      <TextInput
        value={user}
        style={styles.textInput}
        placeholder='k2xxxxx@nu.edu.pk'
        onChangeText={(value) => setUser(value)}
      />
    </View>
    <View style={{ alignItems: 'center', zIndex: -1 }}>
      <Button onPress={submit} style={{ width: '100%' }} text="Add Member" disabled={!isValid()} />
    </View>
  </View>
}

function InfoRoute({ team }: {
  team: Team
}) {
  return <Form>
    {/* Title Input */}
    <FormTextInput
      label="Name*"
      value={team.name}
      disabled
      onChangeText={(_) => { }}
    />

    {/* Submit Button */}
  </Form>

}

const { useParam } = createParam<{ code: string }>()

export function TeamEditScreen() {
  const [teamCode] = useParam('code');
  const { data: team } = useGetTeamQuery(teamCode || '');

  const layout = useWindowDimensions();
  const [index, setIndex] = React.useState(0);
  const [routes] = React.useState([
    { key: 'first', title: 'Info' },
    { key: 'second', title: 'Members' },
  ]);

  if (!team?.society)
    return <TeamScreenError />

  const renderTabBar = props => (
    <TabBar
      indicatorStyle={{ backgroundColor: '#6677cc' }}
      {...props}
      style={{ backgroundColor: 'white' }}
      renderLabel={({ route }) => (
        <Text style={{ color: 'black', margin: 8 }}>
          {route.title}
        </Text>
      )}
    />
  );

  return (
    <TabView
      navigationState={{ index, routes }}
      renderScene={SceneMap({
        first: () => <InfoRoute team={team} />,
        second: () => <MembersRoute team={team} />,
      })}
      onIndexChange={setIndex}
      initialLayout={{ width: layout.width }}
      renderTabBar={renderTabBar}
    />
  )
}

export function TeamScreenError() {
  return <View style={styles.mainContainer}>
    <Text>
      Failed to load screen
    </Text>
  </View>
}

const styles = StyleSheet.create({
  mainContainer: {
    width: '100%',
    flex: 1,
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
  labelContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 5,
  },
  teamContainer: {
    margin: 10,
    padding: 10,
    backgroundColor: 'white',
    borderRadius: 10,
    shadowColor: 'gray',
    shadowOffset: {
      width: 1,
      height: 1,
    },
    shadowOpacity: 0.5,
    shadowRadius: 2,
    elevation: 1,
  },
  label: {
    color: 'gray'
  }
})
