import React, { useState } from "react";
import {
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
  ScrollView,
  FlatList,
} from "react-native";

import EventComponents from "./EventComponents";

const DUMMY_DATA = [
  {
    id: "1",
    key: "win",
    societyImage:
      "https://cdn.discordapp.com/attachments/1059750891512664084/1059788242448293928/307386157_6012211498808266_6769890018935496899_n.png",
    societyName: "DRAMATICS AND CURRICULAR",
    title: "Party on the Beach",
    content:
      "This is a first, amazing party which you definitely should not miss. It will be a lot of fun!",
    poster: "https://images.tpn.to/ir/nt/it/hk/content.jpg",
    rating: 0,
    comments: "",
    postdate: "7:06 pm, 12 Jan 22",
  },
  {
    id: "2",
    key: "won",
    societyImage:
      "https://img.freepik.com/premium-vector/cyber-security-logo-with-shield-check-mark-security-shield-concept-internet-security_100456-983.jpg?w=996",
    societyName: "Cyber Security Society",
    title: "Hacking into Twitter ultra premium!",
    content:
      "Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum Lorem Ipsum Bum Bum Bum ",
    poster:
      "https://www.ict.eu/sites/corporate/files/images/Cyber%20security%20header_1920x1280px%20%281%29.jpg",
    rating: 0,
    comments: "",
    postdate: "4:06 am, 7 Mar 22",
  },
];

export default function EventEmbed() {
  return (
    <ScrollView style={styles.eventContainer}>
      {DUMMY_DATA.map((event) => (
        <EventComponents
          key={event.id}
          id={event.id}
          societyImage={event.societyImage}
          societyName={event.societyName}
          poster={event.poster}
          title={event.title}
          content={event.content}
          rating={event.rating}
          comments={event.comments}
          postdate={event.postdate}
        />
      ))}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  eventContainer: {
    flex: 1,
    marginTop: 8,
  },
});
