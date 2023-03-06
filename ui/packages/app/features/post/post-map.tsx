import { ScrollView, StyleSheet } from 'react-native'
import Text from 'app/components/Text'
import { useListPostsQuery } from './post-api'
import PostContent from './post-content-draw'
import PostDraw from './post-draw'

/**
* Component to fetch and display a scrollable list of posts given an event ID
*/
export function PostMap({ event, contentOnly = false }: {
  event: SocietyEvent,
  contentOnly?: boolean

}) {
  const { data = [] } = useListPostsQuery(event.id);
  let date: string = (new Date(0)).toDateString().slice(0,-5); 

  return (
    <ScrollView style={styles.eventWrapper}>
      {
        data.map((p, i) => {
          const pdate = (new Date(p.createdAt)).toUTCString().slice(0, 16)
          if(pdate !== date) {
            date = pdate;
            return <>
            <Text style={{color: 'gray', marginTop: 20, textAlign: 'center'}}>{pdate}</Text>
            <PostDraw contentOnly data={p} key={i} />
            </>
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
    backgroundColor: '$background',
    flex: 1,
  },
})
