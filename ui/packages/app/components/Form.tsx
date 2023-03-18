import {
  StyleSheet,
  TextInput as RNTextInput,
} from 'react-native'

import {
  Text,
  View,
  Button
} from 'app/components'

import DateTimePicker from './DateTimePicker';

import { useState } from 'react';


export function FormTextInput({ label, subLabel, multiline = false, validate, onChangeText }: {
  label: string,
  subLabel: string,
  multiline?: boolean,
  validate: (s: string) => boolean,
  onChangeText: (s: string) => void
}) {

  const [isValid, setIsValid] = useState(false);

  return <View style={styles.textContainer}>
    <View style={styles.labelContainer}>
      <Text style={styles.label}>{label}</Text>
      <Text style={styles.subLabel}>{subLabel}</Text>
    </View>
    <RNTextInput
      multiline={multiline}
      style={[styles.textInput, !isValid ? styles.invalidInput : {}]}
      onChangeText={(text) => {
        setIsValid(validate(text))
        onChangeText(text)
      }}
    />
  </View>
}


export function FormDateInput({ label, value, onChangeDate, validate }: {
  label: string,
  value?: Date,
  validate: (d: Date) => boolean,
  onChangeDate: (date: Date) => void

}) {

  const [isValid, setIsValid] = useState(false);

  return <View style={styles.textContainer} >
    <Text style={styles.label}>{label}</Text>
    <DateTimePicker
      value={value}
      onChangeDate={(date) => {
        setIsValid(validate(date))
        onChangeDate(date)
      }} />
  </View>
}

export function FormSubmitButton({ label = 'submit', disabled = false, onPress }: {
  label?: string,
  disabled?: boolean
  onPress: () => void
}) {

  return <View style={styles.textContainer} >
    <Button
      disabled={disabled}
      onPress={onPress}
      text={label.toUpperCase()}
    />
  </View>
}

const styles = StyleSheet.create({
  inputTitle: {
    fontSize: 18,
  },
  labelContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  label: {
    color: 'gray',
  },
  subLabel: {
    fontSize: 10,
    color: 'B1B1B1',
    textAlign: 'right',
  },
  textInput: {
    paddingVertical: 5,
    paddingHorizontal: 10,
    backgroundColor: 'white',
    borderRadius: 10,
    color: 'black',
  },
  invalidInput: {
    borderColor: '#ba000d',
    borderWidth: 0.8
  },
  textContainer: {
    marginHorizontal: '3%',
    marginVertical: 4,
    paddingVertical: 5,
    paddingHorizontal: 10,
    borderRadius: 10,
    justifyContent: 'flex-start',
  },
  imageContainer: {},
})
