import { View } from 'dripsy'
import { createParam } from 'solito';
import { ScrollView, StyleSheet, Text } from 'react-native';
import { useNavigation } from '@react-navigation/native'
import React, { useEffect } from 'react';
import { EventMap } from '../event/event-map';
import { SocietyInfo } from './society-info-draw';
import { useGetSocietyQuery } from './society-api';
import SocietyHeader from 'app/components/SocietyHeader';

const { useParam } = createParam<{ code: string }>()

export function SocietyPage() {
  const [societyCode] = useParam('code');
  const navigation = useNavigation();
  const { data: society } = useGetSocietyQuery(societyCode||'');

  useEffect(() => {
    if(society)
      navigation.setOptions({
        headerTitle: () =>
          <SocietyHeader society={society}/>
      })
  }, [society, navigation])

  if(!society)
    return <SocietyScreenError/>    

  return (
    <View
      sx={{
        backgroundColor: '$background',
        flex: 1,
        alignItems: 'center',
      }}
    >
      <ScrollView style={styles.mainContainer}>
        <SocietyInfo society={society} />
        <EventMap />
      </ScrollView>
    </View>
  )
}

function SocietyScreenError() {
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
})
