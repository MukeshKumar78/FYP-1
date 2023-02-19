import { createParam } from 'solito';
import { View, StyleSheet, useWindowDimensions } from 'react-native';
import Text from 'app/components/Text';
import { useNavigation } from '@react-navigation/native'
import React, { useEffect } from 'react';
import { SocietyScreenError } from './screen';
import { useGetSocietyQuery } from './society-api';
import SocietyHeader from 'app/components/SocietyHeader';
import { TabView, SceneMap, TabBar } from 'react-native-tab-view';


function MembersRoute() {
  return <View style={{
    flex: 1,
    alignItems: 'center',
  }}>
    <Text>hello</Text>

  </View>
}

const SecondRoute = () => (
  <View style={{ flex: 1, backgroundColor: '#673ab7' }} />
);


const renderScene = SceneMap({
  first: MembersRoute,
  second: SecondRoute,
});

const { useParam } = createParam<{ code: string }>()

export function SocietyEditPage() {

  const [societyCode] = useParam('code');
  const navigation = useNavigation();
  const { data: society } = useGetSocietyQuery(societyCode || '');

  const layout = useWindowDimensions();
  const [index, setIndex] = React.useState(0);
  const [routes] = React.useState([
    { key: 'first', title: 'Members' },
    { key: 'second', title: 'Second' },
  ]);

  useEffect(() => {
    if (society)
      navigation.setOptions({
        headerTitle: () =>
          <SocietyHeader society={society} />
      })
  }, [society, navigation])

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
      renderScene={renderScene}
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
