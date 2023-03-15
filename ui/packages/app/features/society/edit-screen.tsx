import { createParam } from 'solito';
import { StyleSheet, useWindowDimensions, Image, TextInput } from 'react-native';
import React, { useEffect, useState } from 'react';
import { SocietyScreenError } from './screen';
import { useAddMemberMutation, useGetMembershipsQuery, useGetRolesQuery, useGetSocietyQuery, useRemoveMemberMutation } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { TabView, SceneMap, TabBar } from 'react-native-tab-view';
import { getPublicUri } from 'app/api/util';
import { Option, OptionsModalButton } from 'app/components/OptionsModalButton';
import { usePermissions } from '../auth/useAuth';
import { Text, Button, View } from 'app/components';
import DropDownPicker from 'react-native-dropdown-picker'

function MembersRoute({ society }: {
  society: string
}) {
  const { data } = useGetMembershipsQuery(society);
  const [canAdd, canRemove, canEdit] = usePermissions(society, [
    "MEMBER_ADD",
    "MEMBER_REMOVE",
    "MEMBER_UPDATE"
  ])
  const [remove] = useRemoveMemberMutation();

  function removeMember(member: Membership) {
    remove({
      society,
      user: member.user.code
    })
      .unwrap()
      .catch(error => console.error(error))
  }

  return <View style={{
    flex: 1,
    margin: 5,

  }}>
    <View style={{ zIndex: -100 }}>
      {
        canAdd &&
        <AddMemberView society={society} />
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
            <Text style={{ marginHorizontal: 1, color: 'white', backgroundColor: '#6677cc', padding: 5, borderRadius: 8 }}>
              {membership.role.toLowerCase()}
            </Text>
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

function AddMemberView({ society }: {
  society: string
}) {
  const { data: allRoles } = useGetRolesQuery();
  const [open, setOpen] = useState(false);
  const [err, setErr] = useState("");
  const [email, setEmail] = useState("");
  const [role, setRole] = useState(allRoles?.[-1] || "");
  const [addMember] = useAddMemberMutation();

  function submit() {
    addMember({
      society,
      user: email,
      role
    })
      .unwrap()
      .catch(error => {
        if (error.status == 403 || error.status == 401)
          setErr("Not allowed")
        else
          setErr(error.data?.message || "")

        setEmail("")
        setRole("")
        setTimeout(() => setErr(""), 5000)
      })
  }

  function isValid() {
    return true
  }

  if (!allRoles) return <></>

  return <View style={{ borderWidth: 1, borderColor: 'gainsboro', borderRadius: 5, padding: 10 }}>
    <View style={{}} >
      <View style={styles.labelContainer}>
        <Text style={styles.label}>Email</Text>
      </View>
      <TextInput
        value={email}
        style={styles.textInput}
        placeholder='k2xxxxx@nu.edu.pk'
        onChangeText={(value) => setEmail(value)}
      />
      <View style={styles.labelContainer}>
        <Text style={styles.label}>Role</Text>
      </View>
      <DropDownPicker
        zIndex={1000}
        style={styles.textInput}
        open={open}
        value={role}
        items={allRoles.map(r => ({ label: r, value: r }))}
        setOpen={setOpen}
        setValue={setRole}
      />
    </View>
    <View style={{ alignItems: 'center', zIndex: -1 }}>
      <Button onPress={submit} style={{ width: '100%' }} text="Add Member" disabled={!isValid()} />
    </View>
    <Text style={{ color: '#F62217', marginVertical: 5 }}>{err}</Text>
  </View>
}


const TeamsRoute = () => (
  <View style={{ flex: 1, backgroundColor: '#673ab7' }} />
);


const { useParam } = createParam<{ code: string }>()

export function SocietyEditScreen() {
  const [societyCode] = useParam('code');
  const { data: society } = useGetSocietyQuery(societyCode || '');

  const layout = useWindowDimensions();
  const [index, setIndex] = React.useState(0);
  const [routes] = React.useState([
    { key: 'first', title: 'Members' },
    { key: 'second', title: 'Teams' },
  ]);

  const { createHeader } = useSocietyHeader(society)
  useEffect(createHeader);

  if (!society)
    return <SocietyScreenError />

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
        first: () => <MembersRoute society={society.code} />,
        second: TeamsRoute,
      })}
      onIndexChange={setIndex}
      initialLayout={{ width: layout.width }}
      renderTabBar={renderTabBar}
    />
  )
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
  label: {
    color: 'gray'
  }
})
