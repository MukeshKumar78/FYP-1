import { createParam } from 'solito';
import { ScrollView, StyleSheet, RefreshControl } from 'react-native';
import React, { useEffect, useState } from 'react';
import { EventMap } from '../event/event-map';
import { SocietyInfo } from './society-info-draw';
import { View, Button, Hr } from 'app/components'
import { useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { useMembership } from '../auth/hooks';
import { Error } from 'app/error';

const { useParam } = createParam<{ code: string; drafts?: string }>()

export function SocietyPage() {
  const [societyCode] = useParam('code');
  const [showDrafts] = useParam('drafts')

  const [drafts, setDrafts] = useState(showDrafts == "true");
  const { data: society, isLoading, refetch } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society)
  const membership = useMembership(society?.code);

  useEffect(createHeader);
  useEffect(() => setDrafts(showDrafts == "true"), [showDrafts])

  if (isLoading)
    return <></>

  if (!society)
    return <Error />

  return (
    <View
      style={{
        flex: 1,
        alignItems: 'center',
      }}
    >
      <ScrollView style={styles.mainContainer}
        refreshControl={
          <RefreshControl refreshing={false} onRefresh={refetch} />
        }>
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

const styles = StyleSheet.create({
  mainContainer: {
    width: '100%',
    flex: 1,
  },
})
