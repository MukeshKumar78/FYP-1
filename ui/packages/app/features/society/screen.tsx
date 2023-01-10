import { View } from 'dripsy'
import { createParam } from 'solito';
import { ScrollView, StyleSheet, Text } from 'react-native';
import { useNavigation } from '@react-navigation/native'
import React, { useEffect } from 'react';
import { EventMap } from '../event/event-map';
import { SocietyInfo } from './society-info-draw';
import { useGetSocietyQuery } from './society-api';
import { SocietyHeader } from '../event/screen';

const { useParam } = createParam<{ id: string }>()

export function SocietyPage() {
  const [societyId] = useParam('id');
  const navigation = useNavigation();
  const { data: society } = useGetSocietyQuery(Number(societyId));

  useEffect(() => {
    if(society)
      navigation.setOptions({
        headerTitle: () =>
          <SocietyHeader
            title={society.name}
            image={society.image}
          />
      })
  }, [])

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
