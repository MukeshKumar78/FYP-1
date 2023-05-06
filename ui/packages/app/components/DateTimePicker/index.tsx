import { useState } from "react";
import { StyleSheet, TouchableOpacity, Platform } from "react-native";
import RNDateTimePicker, { DateTimePickerEvent } from '@react-native-community/datetimepicker';
import { View, Text } from '../'

export default function DateTimePicker({ onChangeDate, value }: {
  onChangeDate: (date: Date) => void
  value?: Date
}) {
  const [date, setDate] = useState<Date>(value ? new Date(value) : new Date());
  const [mode, setMode] = useState('date');
  const [show, setShow] = useState(false);

  function onChange(event: DateTimePickerEvent, selectedDate?: Date) {
    if (event.type !== 'set') {
      return
    }

    setShow(false);

    if (!selectedDate) return

    setDate(selectedDate);

    // Execute callback 
    onChangeDate(selectedDate);
  };

  const showMode = (currentMode: string) => {
    if (Platform.OS === 'android') {
      setShow(false);
      // for iOS, add a button that closes the picker
    }
    setMode(currentMode);
    setShow(true);
  };

  const showDatepicker = () => {
    showMode('date');
  };

  const showTimepicker = () => {
    showMode('time');
  };

  return (
    <View>
      <View style={styles.touchableWrapper}>
        <TouchableOpacity style={styles.touchable} onPress={showDatepicker}>
          <Text>
            {value ? date.toDateString() : 'N/A'}
          </Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.touchable} onPress={showTimepicker}>
          <Text>
            {value ? date.toLocaleTimeString().slice(0, -3) : 'N/A'}
          </Text>
        </TouchableOpacity>
      </View>
      {
        show && (
          <RNDateTimePicker
            testID="dateTimePicker"
            value={date}
            mode={mode as any}
            is24Hour={true}
            onChange={onChange}
          />
        )
      }
    </View >
  );
};

const styles = StyleSheet.create({
  touchableWrapper: {
    flexDirection: 'row',
  },
  touchable: {
    backgroundColor: 'white',
    borderColor: 'gray',
    borderWidth: 0.3,
    borderRadius: 15,
    padding: 7,
    marginRight: 8,
    elevate: 5
  }
})
