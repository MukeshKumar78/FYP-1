import { createParam } from 'solito';
import { ScrollView, StyleSheet } from 'react-native';
import React, { useEffect, useState } from 'react';
import { EventMap } from '../event/event-map';
import { SocietyInfo } from './society-info-draw';
import { View, Text, Button, Hr } from 'app/components'
import { useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { useMembership } from '../auth/hooks';

const { useParam } = createParam<{ code: string }>()

export function SocietyPage() {
  const [societyCode] = useParam('code');
  const [drafts, setDrafts] = useState(false);
  const { data: society, isLoading } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society)
  const membership = useMembership(society?.code);

  useEffect(createHeader);

  if (isLoading)
    return <></>

  if (!society)
    return <SocietyScreenError />

  return (
    <View
      style={{
        flex: 1,
        alignItems: 'center',
      }}
    >
      <ScrollView style={styles.mainContainer}>
        <SocietyInfo society={society} />
        <Hr />
        {
          membership &&
          <View style={{ flexDirection: 'row' }}>
            <Button style={{ padding: 5 }} bordered type={drafts ? "outlined" : "filled"} text="Published" onPress={() => setDrafts(false)} />
            <Button style={{ padding: 5 }} bordered type={drafts ? "filled" : "outlined"} text="Drafts" onPress={() => setDrafts(true)} />
          </View>
        }
        <EventMap society={society.code} drafts={drafts} />
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
