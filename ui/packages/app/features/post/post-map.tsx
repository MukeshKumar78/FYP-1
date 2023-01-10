import { ScrollView, StyleSheet } from 'react-native'
import { useListPostsQuery } from './post-api'
import PostContent from './post-content-draw'
import PostDraw from './post-draw'

const posts: SocietyPost[] = [
]

/**
* Component to fetch and display a scrollable list of posts given an event ID
*/
export function PostMap({ eventId, contentOnly = false} : {
  eventId: number,
  contentOnly?: boolean 

}) {
  const { data = [] } = useListPostsQuery(eventId);

  return (
    <ScrollView style={styles.eventWrapper}>
      {data.map((post, i) => (
        contentOnly
          ? <PostContent data={post} key={i} />
          : <PostDraw data={post} key={i} />
      ))}
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
})
