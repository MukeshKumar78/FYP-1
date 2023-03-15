import { View, RefreshControl, ScrollView, StyleSheet } from 'react-native'
import { Button } from 'app/components';
import { useListEventsQuery } from '../event/event-api';
import { useCallback, useEffect, useReducer, useState } from 'react';
import { useListPostsQuery } from '../post/post-api';
import EventDraw from '../event/event-draw'
import PostDraw from '../post/post-draw';


type HomeFeedState = {
  eventIndex: number
  postIndex: number
  eventPage: number
  postPage: number
}

type Feed = {
  type: 'event',
  content: SocietyEvent
} | {
  type: 'post',
  content: SocietyPost
}

const pageSize = 10;

/*
 * Merges events and posts and renders as a infinitely scrollable feed
 * TODO (maybe): move merging/sorting logic to database level and create api
 */
export function HomeFeedMap() {
  const [feed, setFeed] = useState<Feed[]>([]);
  const [refreshing, setRefreshing] = useState(false);

  const onRefresh = useCallback(() => {
    setRefreshing(true);
    dispatch({ postIndex: 0, eventIndex: 0, postPage: 0, eventPage: 0 })
    setRefreshing(false);
  }, []);

  const [state, dispatch] = useReducer(
    (prevState: HomeFeedState, newState: Partial<HomeFeedState>) => {
      return { ...prevState, ...newState }
    },
    {
      eventIndex: 0,
      eventPage: 0,
      postIndex: 0,
      postPage: 0
    }
  )

  const { data: eventPageData } = useListEventsQuery(state.eventPage);
  const { data: postsPageData } = useListPostsQuery({
    page: state.postPage,
    size: pageSize
  });

  useEffect(() => {
    const items: Feed[] = []
    let eventIndex = state.eventIndex;
    let postIndex = state.postIndex;
    const curIndex = eventIndex + postIndex;

    eventPageData?.events.map<Feed>(e => ({ type: 'event', content: e }))
      .concat(
        postsPageData?.posts.map(p => ({ type: 'post', content: p })).filter(Boolean) as Feed[]
      ) // combine events and posts
      .sort((a, b) => new Date(b.content.createdAt).getTime() - new Date(a.content.createdAt).getTime()) // sort by date
      .slice(0, curIndex + pageSize) // get max size
      .filter(Boolean) // filter undefined ( side effect of getting fixed length above )
      .forEach(item => {
        if (item.type == 'event') eventIndex++;
        if (item.type == 'post') postIndex++;

        items.push(item);
      })

    setFeed(items);
    dispatch({ eventIndex, postIndex })

  }, [eventPageData, postsPageData])

  function loadMore() {
    let eventPage = state.eventPage;
    let postPage = state.postPage;
    if (eventPageData && state.eventIndex >= eventPageData.events.length / 2) eventPage++;
    if (postsPageData && state.postIndex >= postsPageData.posts.length / 2) postPage++;

    dispatch({ eventPage, postPage })
  }

  return <ScrollView
    style={styles.eventWrapper}
    refreshControl={
      <RefreshControl refreshing={refreshing} onRefresh={onRefresh} />
    }>
    {feed?.map((item, i) => (
      item.type === 'event' ?
        <EventDraw event={item.content} key={i} />
        : <PostDraw data={item.content} key={i} />
    ))}
    <View style={{ marginVertical: 10, alignItems: 'center' }}>
      <Button type="outlined" text="Load more" onPress={loadMore} />
    </View>
  </ScrollView>
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
})
