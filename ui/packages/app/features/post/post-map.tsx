import { View, ScrollView, StyleSheet } from 'react-native'
import { Text } from 'app/components'
import { useListEventPostsQuery, useListPostsQuery } from './post-api'
import PostDraw from './post-draw'
import { useState } from 'react'
import { toShortDateString } from 'app/api/util'

/**
* Component to fetch and display a scrollable list of posts given an event ID
*/
export function PostMap({ event, contentOnly = false }: {
  event: SocietyEvent,
  contentOnly?: boolean

}) {
  const [page, setPage] = useState(0);
  const { data } = useListEventPostsQuery({
    event: event.id,
    page,
    size: 10
  });

  let date: string = (new Date(0)).toDateString().slice(0, -5);

  return (
    <ScrollView style={styles.eventWrapper}>
      {
        data?.data.map((p, i) => {
          const pdate = toShortDateString(p.createdAt)
          if (pdate !== date) {
            date = pdate;
            return <View key={i}>
              <Text style={{ color: 'gray', marginTop: 20, textAlign: 'center' }}>{pdate}</Text>
              <PostDraw contentOnly data={p} />
            </View>
          }
          else
            return <PostDraw contentOnly data={p} key={i} />
        })
      }
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    flex: 1,
  },
})
