import { ScrollView, StyleSheet, Image, RefreshControl } from 'react-native';
import { View, Text, Hr, AnimatedLink, H1 } from 'app/components'
import { useGetTenuresQuery } from './society-api';
import { Error } from 'app/error';
import { getPublicUri } from 'app/api/util';
import { useHeader } from 'app/hooks/headers';
import { useState, useEffect } from 'react';


export function SocietyMapScreen() {
  const { data, refetch } = useGetTenuresQuery()
  const { createHeader } = useHeader();

  useEffect(() => createHeader(<H1>Societies</H1>), [])

  if (!data) return <Error />

  return <ScrollView
    style={styles.container}
    refreshControl={
      <RefreshControl refreshing={false} onRefresh={refetch} />
    }>
    <TenureMap tenures={data} />
  </ScrollView>

}

export function TenureMap({ tenures }: {
  tenures: Tenure[]
}) {

  return (
    <>
      {tenures.map(tenure => (
        <View key={tenure.id}>
          <Text style={{ color: 'gray', marginTop: 20, marginBottom: 5, textAlign: 'center' }}>{tenure.duration}</Text>
          <SocietyMap societies={tenure.societies} />
          <Hr />
        </View>
      ))}
    </>
  )
}

function SocietyMap({ societies }: {
  societies: Society[]
}) {

  return (
    <View style={{ width: '100%' }}>
      {societies.map(society => (
        <View key={society.id} style={{
          borderBottomWidth: 1, borderColor: 'white', borderRadius: 10,
          backgroundColor: '#EFEFEF',
          shadowColor: 'gray', shadowOffset: { width: 0.1, height: 0.1 },
          padding: 7, margin: 3,
        }}>
          <AnimatedLink href={`/society/${society.code}`}>
            <View style={{ flexDirection: 'row', alignItems: 'center' }}>
              <Image
                style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
                source={{ uri: getPublicUri(society.image) }}
              />
              <View style={{ flexShrink: 1 }}>
                <Text style={{ fontSize: 22 }}>{society.fullName}</Text>
                <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                  <Text style={{ color: 'gray', fontSize: 14 }}>{society.totalMembers || 0} member{society.totalMembers > 1 ? 's' : ''} - </Text>
                  <Text style={{ color: 'gray', fontSize: 14 }}>{society.totalEvents || 0} event{society.totalEvents > 1 ? 's' : ''}</Text>
                </View></View>
            </View>
          </AnimatedLink>
        </View>
      ))
      }
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
})
