import { useNavigation } from '@react-navigation/native';
import { createParam } from 'solito';
import { H1 } from 'dripsy'
import { useEffect, useReducer } from 'react';
import {
  StyleSheet,
  View,
  Text,
  TextInput,
} from 'react-native'
import { ScrollView } from 'react-native-gesture-handler'
import { SocietyHeader } from './screen';
import { useGetSocietyQuery } from '../society/society-api';
import DateTimePicker from 'app/components/DateTimePicker';
import ImagePicker, { EventImage } from 'app/components/ImagePicker';

const { useParam } = createParam<{ id: string }>()

type FormState = {
  title: string
  text: string
  startDate: Date
  endDate?: Date
  images?: EventImage[]
}

type FormAction = {
  key: string
  value: string|Date|EventImage[]
}

export function EventCreate() {
  const [societyId] = useParam('id');
  const { data: society } = useGetSocietyQuery(Number(societyId));
  const navigation = useNavigation();

  const [state, dispatch] = useReducer(
    (prevState: FormState, { key, value }: FormAction) => {
      return {
        ...prevState,
        [key]: value
      }
    },
    {
      title: '',
      text: '',
      startDate: new Date(),
      endDate: undefined 

    }
  )

  useEffect(() => {
    if (society)
      navigation.setOptions({
        headerTitle: () =>
          <SocietyHeader
            title={society.name}
            image={society.image}
          />
      })
  }, [])

  if (!society)
    return <EventCreateError />

  return (
    <ScrollView style={styles.mainContainer}>

      <View style={styles.titleContainer}>
        <H1 style={styles.heading}>Create an Event</H1>

        {/* Title Input */}
        <View style={styles.textContainer}>
          <Text style={styles.label}>Title*</Text>
          <TextInput
            style={styles.textInput}
            onChangeText={(value) => dispatch({ key: 'title', value })}
          />
        </View>

        {/* Text Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>Text*</Text>
          <TextInput
            style={styles.textInput}
            multiline={true}
            onChangeText={(value) => dispatch({ key: 'text', value })}
          />
        </View>

        {/* Start Date Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>Start Date*</Text>
          <DateTimePicker 
            value={state.startDate}
            onChangeDate={(value) => dispatch({key: 'startDate', value})}/>
        </View>

        {/* End Date Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>End Date</Text>
          <DateTimePicker 
            value={state.endDate}
            onChangeDate={(value) => dispatch({key: 'endDate', value})}/>
        </View>

        {/* Media Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>End Date</Text>
          <ImagePicker onPick={(value) => dispatch({key: 'images', value})}/>
        </View>
         
      </View>
    </ScrollView>
  )
}

function EventCreateError() {
  return <View style={styles.mainContainer}>
    <Text>
      Failed to load screen
    </Text>
  </View>
}

const styles = StyleSheet.create({
  mainContainer: {
    width: '100%',
    flex: 1,
  },
  heading: {
    marginHorizontal: '3%',
  },
  titleContainer: {
    backgroundColor: '#F8F8F8',
    paddingVertical: 10,
    marginHorizontal: 5,
    marginVertical: 4,
    borderRadius: 10,
    shadowColor: 'gray',
    shadowOffset: {
      width: 2,
      height: 1,
    },
    shadowOpacity: 0.1,
    shadowRadius: 1,
    elevation: 2,
  },

  inputTitle: {
    fontSize: 18,
  },
  label: {
    color: 'gray'
  },
  textInput: {
    paddingVertical: 5,
    paddingHorizontal: 10,
    backgroundColor: 'white',
    borderRadius: 10,
    color: 'black',
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
