import { H1 } from 'dripsy'
import { ScrollView, View, StyleSheet } from 'react-native'
import EventPageDraw from './event-page-draw'
import PostContent from '../post/post-content-draw'

const posts = {
  id: 1,
  title: 'Gari Kharab',
  text: `Sab ghar chalay jao, Jeep kharab hogai, bachiyan nigga hogaen, zindagi tabah hogai, `,
  image: 'https://picsum.photos/1280/720',
}

const events: SocietyEvent[] = [
  {
    id: 1,
    title: 'Annual Tour 2023',
    text: `
If you miss this, you will regret it.
If you do this, you will never forget it.
It's a once in a lifetime opportunity to explore the aesthetic beauty of Pakistan. 
So, have you bought your tickets? If not, then what's the hold up? Head over to One-stop since there are only a few tickets remaining!
Details for Tickets:
Venue: One Stop
Timings: 09:00 - 03:30
Looking forward to see you all!
`,
    image: 'https://picsum.photos/1230/720',
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
]

{
  /*MAPPER COMPONENT THAT MAPS ALL EVENT DATA*/
}
export function EventPageMap() {
  return (
    <ScrollView style={styles.eventWrapper}>
      {/* EVENT MAPPER */}
      {events.map((ev, i) => (
        <EventPageDraw data={ev} key={i} />
      ))}
      {/* POSTS MAPPER */}
      <View style={styles.postWrapper}>
        <PostContent
          title={posts.title}
          text={posts.text}
          image={posts.image}
        />
      </View>
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
  postWrapper: {
    margin: 5,
    backgroundColor: '#E8E8E8',
    borderRadius: 20,
  },
})
