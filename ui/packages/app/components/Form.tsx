import { ReactNode, useState } from 'react';

import {
  StyleSheet,
  TextInput as RNTextInput,
  ScrollView,
  ViewStyle,
  StyleProp
} from 'react-native'

import {
  Text,
  View,
  Button
} from 'app/components'

import DateTimePicker from './DateTimePicker';

import ImagePicker, { ImagePickerAsset } from './ImagePicker';

export function Form({ children, style }: {
  children: ReactNode[] | ReactNode
  style?: StyleProp<ViewStyle>
}) {
  return <ScrollView style={[styles.form, style]}>
    {children}
  </ScrollView>
}

export function FormTextInput({ label, subLabel = '', value = '', multiline = false, disabled = false, validate = (_) => false, onChangeText }: {
  label: string,
  subLabel?: string,
  value?: string,
  multiline?: boolean,
  validate?: (s: string) => boolean,
  disabled?: boolean
  onChangeText: (s: string) => void
}) {

  const [isValid, setIsValid] = useState(validate(value));

  return <View style={styles.container}>
    <View style={styles.labelContainer}>
      <Text style={styles.label}>{label}</Text>
      <Text style={styles.subLabel}>{subLabel}</Text>
    </View>
    <RNTextInput
      editable={!disabled}
      multiline={multiline}
      value={value}
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
  validate: (d?: Date) => boolean,
  onChangeDate: (date: Date) => void

}) {

  const [isValid, setIsValid] = useState(validate(value));

  return <View style={styles.container} >
    <Text style={styles.label}>{label}</Text>
    <DateTimePicker
      value={value}
      onChangeDate={(date) => {
        setIsValid(validate(date))
        onChangeDate(date)
      }} />
  </View>
}

export function FormImagePicker({ label, subLabel, onPick, validate = (_) => true }: {
  label: string,
  subLabel: string,
  onPick: (assets: (File | ImagePickerAsset)[]) => void
  validate?: (assets: (File | ImagePickerAsset)[]) => boolean
}) {

  const [isValid, setIsValid] = useState(false);

  return <View style={styles.container} >
    <View style={styles.labelContainer}>
      <Text style={styles.label}>{label}</Text>
      <Text style={styles.subLabel}>{subLabel}</Text>
    </View>
    <ImagePicker
      onPick={assets => {
        setIsValid(validate(assets))
        onPick(assets)
      }}
    />
  </View>
}

export function FormSubmitButton({ label = 'submit', disabled = false, onPress }: {
  label?: string,
  disabled?: boolean
  onPress: () => void
}) {

  return <View style={styles.container} >
    <Button
      disabled={disabled}
      onPress={onPress}
      text={label.toUpperCase()}
    />
  </View>
}

const styles = StyleSheet.create({
  form: {
    margin: 5,
    padding: 10,
    borderRadius: 10,
    backgroundColor: '#F8F8F8',
    shadowColor: 'gray',
    shadowOffset: {
      width: 2,
      height: 1,
    },
    shadowOpacity: 0.1,
    shadowRadius: 1,
    elevation: 2,
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
  container: {
    margin: 4,
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
  imageContainer: {},
})
