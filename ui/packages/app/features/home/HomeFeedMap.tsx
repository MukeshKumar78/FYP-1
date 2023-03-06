import { View, RefreshControl, ScrollView, StyleSheet } from 'react-native'
import EventDraw from '../event/event-draw'
import { useListEventsQuery } from '../event/event-api';
import { useCallback, useReducer, useState } from 'react';
import { Button } from 'app/components/Button';


type FeedState = {
  eventPage: number,
  postPage: number,
  eventIndex: number,
  postIndex: number
}

type FeedAction = {
  key: string
  value: FeedState[keyof FeedState]
}
/*
* Component to fetch and display a scrollable list of events
*/
export function EventMap() {

  const [feed, dispatch] = useReducer(
    (prevState: FeedState, { key, value }: FeedAction) => {
      return {
        ...prevState,
        [key]: value
      }
    },
    {
      eventPage: 0,
      postPage: 0,
      eventIndex: 0,
      postIndex: 0
    }
  )
}

