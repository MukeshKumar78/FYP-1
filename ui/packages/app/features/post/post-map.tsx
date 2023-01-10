import { ScrollView, StyleSheet } from 'react-native'
import PostDraw from './post-draw'

const posts: SocietyPost[] = [
  {
    id: 1,
    title: 'Gari Kharab',
    text: `Sab ghar chalay jao, Jeep kharab hogai, bachiyan nigga hogaen, zindagi tabah hogai, `,
    image: 'https://picsum.photos/1280/720',
    event: {
      id: 1,
      title: 'Annual Tour 2023',
      text: ` Event Text `,
      image: 'https://picsum.photos/1280/720',
      startDate: new Date(),
      endDate: new Date(),

      society: {
        id: 1,
        name: 'DECS',
        fullName: "yo",
        image:
          'https://cdn.discordapp.com/attachments/1059750891512664084/1059788242448293928/307386157_6012211498808266_6769890018935496899_n.png',
        createdAt: new Date(),
        tenure: {
          id: 1,
          code: 'yoo',
          description: 'bruh',
          duration: '2022-2023',
        },
      },
    },
  },
]

/**
* Component to fetch and display a scrollable list of posts given an event ID
*/
export function PostMap({ eventId } : {
  eventId: number
}) {
  return (
    <ScrollView style={styles.eventWrapper}>
      {/* POST MAPPER */}
      {posts.map((post, i) => (
        <PostDraw data={post} key={i} />
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
