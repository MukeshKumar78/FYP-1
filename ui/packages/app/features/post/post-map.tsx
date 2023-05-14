import { View, ScrollView, StyleSheet } from 'react-native'
import { Text, Button } from 'app/components'
import { useListEventPostsQuery } from './post-api'
import PostDraw from './post-draw'
import { useEffect, useState } from 'react'
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
    size: 5
  });


  let date: string = (new Date(0)).toDateString().slice(0, -5);

  function loadMore() {
    setPage(page => page + 1);
  }

  // Refresh posts on event update
  useEffect(() => setPage(0), [event])

  return (
    <ScrollView
      style={styles.eventWrapper}>
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
      <View style={{ marginVertical: 10, alignItems: 'center' }}>
        <Button type="outlined" text="Load more" onPress={loadMore} />
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    flex: 1,
  },
})
