import { View, Image, StyleSheet, Text } from 'react-native'
import DateRender from 'app/components/DateRender'
import DropdownModal from './comment-option'
import React, { useState } from 'react'

const options = ['Delete', 'Report']

export default function CommentRender(data) {
  const [selectedOption, setSelectedOption] = useState(null)

  const handleSelectOption = (option) => {
    setSelectedOption(option)
  }
  return (
    <View style={styles.featureContainer}>
      {/* IMAGE RENDER*/}
      <Image style={styles.userImage} source={{ uri: data.user_pfp }} />

      {/* USER NAME AND TEXT CONTAINER*/}
      <View style={styles.nameCommentContainer}>
        {/* USER NAME / DATE / OPTIONS BUTTON CONTAINER*/}
        <View style={styles.nameDateOptionContainer}>
          {/* USER NAME / DATE  CONTAINER*/}
          <View style={styles.nameDateContainer}>
            <Text style={styles.userName}>{data.username}</Text>
            <Text style={styles.commentDate}>
              <DateRender date={data.cdate} />
            </Text>
          </View>
          <DropdownModal
            options={options}
            onSelectOption={handleSelectOption}
          />
        </View>

        {/* COMMENT TEXT */}
        <View style={styles.textContainer}>
          <Text style={styles.commentText}>{data.text}</Text>
        </View>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  featureContainer: {
    marginVertical: 2,
    paddingVertical: '2%',
    borderWidth: 0,
    borderColor: 'black',
    borderRadius: 10,
    width: '100%',
    flexDirection: 'row',
    backgroundColor: '#EFEFEF',
  },

  nameCommentContainer: {
    borderWidth: 0,
    borderColor: 'green',
    alignItems: 'flex-start',
    width: '100%',
  },

  userImage: {
    margin: 5,
    width: 40,
    height: 40,
    borderRadius: 50,
  },
  nameDateContainer: {
    flexDirection: 'row',
    // borderWidth: 1,
  },

  nameDateOptionContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    width: '100%',
    paddingRight: '17%',
  },
  userName: {
    // borderWidth: 2,
    fontWeight: 800,
    fontSize: 15,
    marginRight: '5%',
  },

  commentDate: {
    color: 'gray',
    fontSize: 11,
    alignSelf: 'center',
  },

  optionButton: {
    borderWidth: 1,
    height: 15,
    width: 15,
  },

  textContainer: {
    width: '83%',
    //borderWidth: 2,
    borderColor: 'blue',
  },

  commentText: {},
})
