import CommentRender from "./comment-draw";
import { View, Text, StyleSheet } from "react-native";

const DUMMY_DATA = [
  {
    id: "1",
    code: "XYZ",
    description: "wut",
    text: "I'm sexy and I know it",
    cdate: new Date(),
    username: "Mohsin Sheikh",
    user_id: "69",
    user_pfp:
      "https://cdn.discordapp.com/attachments/941708949479129140/1075887414343630938/Couch-Potato-Couple.png",
    event_id: "420",
  },
  {
    id: "2",
    code: "XYZ",
    description: "wot",
    text: "I can't fucking take it any more. Among Us has singlehandedly ruined my life. The other day my teacher was teaching us Greek Mythology and he mentioned a pegasus and I immediately thought 'Pegasus? more like Mega Sus!!!!' and I've never wanted to kms more. I can't look at a vent without breaking down and fucking crying. I can't eat pasta without thinking 'IMPASTA??? THATS PRETTY SUS!!!!' Skit 4 by Kanye West. The lyrics ruined me. A Mongoose, or the 25th island of greece. The scientific name for pig. I can't fucking take it anymore. \n\nPlease fucking end my suffering",
    cdate: new Date(),
    username: "Shrek 2",
    user_id: "1337",
    user_pfp:
      "https://cdn.discordapp.com/attachments/941708949479129140/1075888263778279484/chrome_fkeb4MPu4W.png",
    event_id: "720",
  },
];

export function CommentMap() {
  return (
    <View style={styles.commentWrapper}>
      {DUMMY_DATA.map((comment) => (
        <CommentRender
          code={comment.code}
          id={comment.id}
          description={comment.description}
          text={comment.text}
          user_id={comment.user_id}
          user_pfp={comment.user_pfp}
          event_id={comment.event_id}
          username={comment.username}
          cdate={comment.cdate}
        />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  commentWrapper: {
    marginTop: 50,
    width: "100%",
    backgroundColor: "$background",
    flex: 1,
  },
});
