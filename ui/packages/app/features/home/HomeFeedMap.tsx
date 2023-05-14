import { View, RefreshControl, ScrollView, StyleSheet } from 'react-native'
import { Button } from 'app/components';
import { useListEventsQuery } from '../event/event-api';
import { useCallback, useEffect, useReducer, useRef, useState } from 'react';
import { useListPostsQuery } from '../post/post-api';
import EventDraw from '../event/event-draw'
import PostDraw from '../post/post-draw';


type HomeFeedState = {
  page: number
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

const pageSize = 5;

/*
 * Merges events and posts and renders as a infinitely scrollable feed
 * TODO: move merging/sorting logic to database level and create api
 */
export function HomeFeedMap() {
  const [feed, setFeed] = useState<Feed[]>([]);
  const [refreshing, setRefreshing] = useState(false);
  const postIndex = useRef(0);
  const eventIndex = useRef(0);

  const onRefresh = useCallback(() => {
    setRefreshing(true);

    if (state.postPage == 0) refetchPosts();
    if (state.eventPage == 0) refetchEvents();
    if (state.postPage != 0 || state.eventPage != 0)
      dispatch({ page: 1, postPage: 0, eventPage: 0 })

    setRefreshing(false);
  }, []);

  const [state, dispatch] = useReducer(
    (prevState: HomeFeedState, newState: Partial<HomeFeedState>) => {
      return { ...prevState, ...newState }
    },
    {
      page: 1,
      eventPage: 0,
      postPage: 0
    }
  )

  const { data: eventPageData, refetch: refetchEvents } = useListEventsQuery({
    page: state.eventPage,
    size: pageSize
  });
  const { data: postsPageData, refetch: refetchPosts } = useListPostsQuery({
    page: state.postPage,
    size: pageSize
  });

  // console.log({ eventIndex: eventIndex.current, postIndex: postIndex.current, ...state })

  useEffect(() => {
    const items: Feed[] = []

    postIndex.current = 0
    eventIndex.current = 0

    eventPageData?.data.map<Feed>(e => ({ type: 'event', content: e }))
      .concat(
        postsPageData?.data.map(p => ({ type: 'post', content: p })).filter(Boolean) as Feed[]
      ) // combine events and posts
      .sort((a, b) => new Date(b.content.createdAt).getTime() - new Date(a.content.createdAt).getTime()) // sort by date
      .slice(0, pageSize * state.page)
      .filter(Boolean) // filter undefined ( side effect of getting fixed length above )
      .forEach(item => {
        if (item.type == 'event') eventIndex.current++;
        if (item.type == 'post') postIndex.current++;

        items.push(item);
      })

    setFeed(items);
  }, [eventPageData?.data, postsPageData?.data, state.page])

  function loadMore() {
    let eventPage = state.eventPage;
    let postPage = state.postPage;
    if (eventPageData && eventIndex.current >= eventPageData.data.length / 2) eventPage++;
    if (postsPageData && postIndex.current >= postsPageData.data.length / 2) postPage++;


    dispatch({ eventPage, postPage, page: state.page + 1 })
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
