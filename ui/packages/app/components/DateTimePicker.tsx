import { useState } from "react";
import { View, Button, Text, Platform } from "react-native";
import RNDateTimePicker  from '@react-native-community/datetimepicker';

export default function DateTimePicker({ title }: {
  title: string
}) {
  const [date, setDate] = useState(new Date(1598051730000));
  const [mode, setMode] = useState('date');
  const [show, setShow] = useState(false);

  const onChange = (_: any, selectedDate: Date) => {
    const currentDate = selectedDate;
    setShow(false);
    setDate(currentDate);
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
      <Button onPress={showDatepicker} title={`${title} date`} />
      <Button onPress={showTimepicker} title={`${title} time`} />
      <Text>selected: {date.toLocaleString()}</Text>
      {show && (
        <RNDateTimePicker
          testID="dateTimePicker"
          value={date}
          mode={mode as any}
          is24Hour={true}
          onChange={onChange}
        />
      )}
    </View>
  );
};
