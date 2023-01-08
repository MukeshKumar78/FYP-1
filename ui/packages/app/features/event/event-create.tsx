import { ScaledImage } from 'app/components/ScaledImage'
import { H1, View as DView } from 'dripsy'
import {
  Image,
  StyleSheet,
  View,
  TextInput,
  Button,
  Platform,
} from 'react-native'
import Text from '../../components/Text'
import { ScrollView } from 'react-native-gesture-handler'
import DateTimePicker from '@react-native-community/datetimepicker'
import React, { useState } from 'react'
import { launchCamera, launchImageLibrary } from 'react-native-image-picker'

export function EventCreate() {
  const [eventTitle, setTitle] = useState('')
  const [eventText, setText] = useState('')

  const [startDate, setStartDate] = useState(new Date())
  const [endDate, setEndDate] = useState(new Date())
  const [mode, setMode] = useState('date')
  const [dateText, setDateText] = useState('Empty')
  const [show, setShow] = useState(false)

  const onChange = (selectedDate) => {}

  const showDateMode = (currentDateMode) => {
    setShow(true)
    setMode(currentDateMode)
  }

  function titleInputHandler(titleinput) {
    setTitle(titleinput)
    console.log(eventTitle)
  }

  function textInputHandler(textinput) {
    setText(textinput)
    console.log(eventText)
  }

  {
    /* */
  }
  return (
    <ScrollView style={styles.mainContainer}>
      {/* HEADING OF PAGE*/}
      <H1 style={styles.heading}>Create an Event</H1>

      {/* TAKING TITLE INPUT*/}
      <View style={styles.titleContainer}>
        <TextInput
          style={styles.inputTitle}
          placeholder="Enter Event Title"
          multiline={true}
          onChangeText={textInputHandler}
        />
      </View>

      {/* TAKING TEXT INPUT*/}
      <View style={styles.textContainer}>
        <TextInput
          style={styles.inputText}
          placeholder="Enter Text Content"
          multiline={true}
          onChangeText={textInputHandler}
        />
      </View>

      {/* TAKING IMAGE INPUT*/}
      <View style={styles.imageContainer}></View>

      {/* TAKING DATES INPUT*/}

      {/* BUTTON TO CONFIRM ALL CHANGES*/}
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  mainContainer: {
    borderWidth: 3,
    borderColor: 'green',
    width: '100%',
    flex: 1,
  },
  heading: {
    marginHorizontal: '3%',
  },
  titleContainer: {
    backgroundColor: '#F5F5F5',
    marginHorizontal: '3%',
    marginVertical: 4,
    paddingVertical: 5,
    paddingHorizontal: 10,
    borderRadius: 10,
  },

  inputTitle: {
    fontSize: 18,
  },
  inputText: {},

  textContainer: {
    backgroundColor: '#F5F5F5',
    marginHorizontal: '3%',
    marginVertical: 4,
    paddingVertical: 5,
    paddingHorizontal: 10,
    borderRadius: 10,
    justifyContent: 'flex-start',
  },
  imageContainer: {},
})
