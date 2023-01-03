import React, { useRef, useEffect, useState } from "react";
import {
  View,
  Text,
  Image,
  TouchableOpacity,
  TouchableHighlight,
  Picker,
} from "react-native";

const options = ["Register", "Mute Event", "Cancel"];

export default function EventComponents(props) {
  const [selectedValue, setSelectedValue] = React.useState(options[2]);
  return (
    <View style={styles.container}>
      <View style={styles.titleBar}>
        <Image
          style={styles.profileImage}
          source={{ uri: props.societyImage }}
        />

        <View style={styles.societyNameContainer}>
          <Text style={styles.userName}> {props.societyName} </Text>
          <Text style={styles.date}>{props.postdate}</Text>
        </View>
        <TouchableOpacity style={styles.optionButton}>
          <Image
            source={{
              uri: "https://cdn.discordapp.com/attachments/1059750891512664084/1059750933157904425/CITYPNG.COMDown_Head_Arrow_Black_-_512x512.png",
            }}
            resizeMode="contain"
            style={{ height: undefined, aspectRatio: 1, opacity: 0.3 }}
          />
        </TouchableOpacity>
      </View>

      <View style={styles.contentContainer}>
        <Text style={styles.title}>{props.title}</Text>
        <Text style={styles.content}>{props.content}</Text>
        <View style={styles.posterContainer}>
          <Image
            source={{
              uri: props.poster,
            }}
            style={styles.eventPoster}
            resizeMode="contain"
          />
        </View>
      </View>

      <View style={styles.interactiveContainer}>
        <TouchableOpacity style={styles.interactiveButton}>
          <Image
            source={{
              uri: "https://cdn.discordapp.com/attachments/1059750891512664084/1059756038913540146/clipart477719.png",
            }}
            resizeMode="contain"
            style={{ height: 25, aspectRatio: 1 }}
          />
        </TouchableOpacity>
        <TouchableOpacity style={styles.interactiveButton}>
          <Image
            source={{
              uri: "https://cdn.discordapp.com/attachments/1059750891512664084/1059759462388342814/output-onlinepngtools.png",
            }}
            resizeMode="contain"
            style={{ height: 25, aspectRatio: 1 }}
          />
        </TouchableOpacity>
        <TouchableOpacity style={styles.interactiveButton}>
          <Image
            source={{
              uri: "https://cdn.discordapp.com/attachments/1059750891512664084/1059759842966904882/toppng.com-share-png-file-share-icon-free-download-980x904.png",
            }}
            resizeMode="contain"
            style={{ height: 25, aspectRatio: 1 }}
          />
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = {
  container: {
    flex: 1,
    borderColor: "#DEDEDE",
    borderWidth: 2,
    marginRight: "0.5%",
    marginLeft: "0.5%",
    marginBottom: 20,
    borderRadius: 5,
  },
  //TITLE BAR STYLING AND SHIT
  titleBar: {
    flexDirection: "row",
    flex: 2,
    borderBottomWidth: 1,
    borderBottomColor: "#DEDEDE",
    margin: "0.5%",
    padding: "1%",
    backgroundColor: "#EFEFEF",
  },
  profileImage: {
    aspectRatio: 1,
    borderRadius: 25,
    borderWidth: 1,
    flex: 2,
    margin: 2,
  },
  societyNameContainer: {
    flex: 11,
    margin: 5,
  },
  userName: {
    flex: 2,
    textAlignVertical: "center",
    fontSize: 17,
    fontWeight: "bold",
    color: "#333",
  },
  date: {
    flex: 1,
    fontSize: 11,
    marginLeft: "4%",
  },
  optionButton: {
    flex: 1,
    margin: 5,
    justifyContent: "center",
    width: "100%",
  },

  //EVENT TITLE CONTENT IMAGE STYLING AND SHIT
  contentContainer: {
    flexDirection: "column",
    flex: 6,
    margin: 2,
  },
  title: {
    borderWidth: 0,
    borderColor: "black",
    margin: "1%",
    fontSize: 25,
    fontWeight: "bold",
    color: "black",
  },
  content: {
    borderWidth: 0,
    borderColor: "black",
    marginLeft: "1.5%",
    marginRight: "1%",
    marginBottom: "5%",
  },

  posterContainer: {
    height: undefined,
    aspectRatio: 1,
  },
  eventPoster: {
    flex: 1,
  },

  // INTERACTIVE BAR w/ RATING COMMENT SHARE STYLING AND SHIT
  interactiveContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
    flex: 1,
    height: 34,
    backgroundColor: "#F8F8F8",
  },
  interactiveButton: {
    backgroundColor: "white",
    flex: 1,
    margin: 0,
    justifyContent: "center",
    alignItems: "center",
  },
};
