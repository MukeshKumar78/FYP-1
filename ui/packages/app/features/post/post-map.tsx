import { H1 } from 'dripsy'
import { ScrollView, View, StyleSheet } from 'react-native'
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
        title: 'DECS',
        image:
          'https://cdn.discordapp.com/attachments/1059750891512664084/1059788242448293928/307386157_6012211498808266_6769890018935496899_n.png',
        tenure: {
          title: '2022-2023',
        },
      },
    },
  },
]

{
  /*MAPPER COMPONENT THAT MAPS ALL EVENT DATA*/
}
export function PostMap() {
  return (
    <ScrollView style={styles.eventWrapper}>
      {/* EVENT MAPPER */}
      {posts.map((pv, i) => (
        <PostDraw data={pv} key={i} />
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
