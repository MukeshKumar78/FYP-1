import { createParam } from 'solito';
import { View, ScrollView, StyleSheet, Text } from 'react-native';
import React, { useEffect } from 'react';
import { EventMap } from '../event/event-map';
import { SocietyInfo } from './society-info-draw';
import { useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { LoadingScreen } from '../loading/screen';

const { useParam } = createParam<{ code: string }>()

export function SocietyPage() {
  const [societyCode] = useParam('code');
  const { data: society, isLoading } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society)

  useEffect(createHeader);

  if(isLoading)
    return <></>

  if (!society)
    return <SocietyScreenError />

  return (
    <View
      style={{
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

export function SocietyScreenError() {
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
