import { createParam } from 'solito';
import { View, StyleSheet, useWindowDimensions, Image } from 'react-native';
import Text from 'app/components/Text';
import React, { useEffect } from 'react';
import { SocietyScreenError } from './screen';
import { useGetMembershipsQuery, useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { TabView, SceneMap, TabBar } from 'react-native-tab-view';
import { getPublicUri } from 'app/api/util';
import { Option, OptionsModalButton } from 'app/components/OptionsModalButton';

function MembersRoute({ society }: {
  society: string
}) {
  const { data } = useGetMembershipsQuery(society);

  return <View style={{
    flex: 1,
    margin: 5
  }}>
    {data?.map((membership, i) =>
      <View key={i} style={{ flexDirection: 'row', alignItems: 'center' }}>
        <Image
          style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
          source={{ uri: getPublicUri(membership.user.photo) }}
        />
        <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' }}>
          <View>
            <Text>{membership.user.firstName} {membership.user.lastName}</Text>
            <Text style={{ color: 'gray', fontSize: 12 }}>{membership.user.code}</Text>
          </View>
          <Text style={{ marginHorizontal: 5, color: '#2F4F4F', backgroundColor: 'gainsboro', padding: 5, borderRadius: 8 }}>{membership.role.toLowerCase()}</Text>
        </View>
        <OptionsModalButton>
          <Option text="hello" onPress={() => {}}/>
        </OptionsModalButton>
      </View>
    )
    }
  </View >
}

const SecondRoute = () => (
  <View style={{ flex: 1, backgroundColor: '#673ab7' }} />
);


const { useParam } = createParam<{ code: string }>()

export function SocietyEditPage() {
  const [societyCode] = useParam('code');
  const { data: society } = useGetSocietyQuery(societyCode || '');

  const layout = useWindowDimensions();
  const [index, setIndex] = React.useState(0);
  const [routes] = React.useState([
    { key: 'first', title: 'Members' },
    { key: 'second', title: 'Second' },
  ]);

  const { createHeader } = useSocietyHeader(society)
  useEffect(createHeader);

  if (!society)
    return <SocietyScreenError />

  const renderTabBar = props => (
    <TabBar
      {...props}
      style={{ backgroundColor: 'white' }}
      renderLabel={({ route, focused, color }) => (
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
        second: SecondRoute,
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
})
