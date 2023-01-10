import { useNavigation } from '@react-navigation/native';
import { createParam } from 'solito';
import { H1 } from 'dripsy'
import { useEffect, useReducer, useState } from 'react';
import {
  StyleSheet,
  View,
  Text,
  TextInput,
  Button
} from 'react-native'
import { ScrollView } from 'react-native-gesture-handler'
import { SocietyHeader } from './screen';
import { useGetSocietyQuery } from '../society/society-api';
import DateTimePicker from 'app/components/DateTimePicker';
import ImagePicker from 'app/components/ImagePicker';
import { useAddEventMutation } from './event-api';
import { useRouter } from 'solito/router';
import { z } from 'zod';

const { useParam } = createParam<{ id: string }>()

interface FormState extends Partial<Event> {
  title: string
  text: string
  startDate: Date
  endDate?: Date
  images?: string[]
}

type FormAction = {
  key: string
  value: string | Date | string[]
}

const eventSchema = z.object({
  title: z.string().min(5),
  text: z.string().min(10),
  startDate: z.date().min(new Date()),
  endDate: z.date().min(new Date()).optional(),
  images: z.string().array()
})

export function EventCreate() {
  const [societyId] = useParam('id');
  const { data: society } = useGetSocietyQuery(Number(societyId));
  const [postEvent] = useAddEventMutation();
  const [isValid, setIsValid] = useState(false);
  const navigation = useNavigation();
  const router = useRouter();

  const [state, dispatch] = useReducer(
    (prevState: FormState, { key, value }: FormAction) => {
      const data = {
        ...prevState,
        [key]: value
      }
      const parsed = eventSchema.safeParse(data);
      if(parsed.success) {
        setIsValid(true);
      }
      else {
        console.log(parsed.error)
        setIsValid(false);
      }
      return data;
    },
    {
      title: '',
      text: '',
      startDate: new Date(),
      endDate: undefined,
      images: []
    }
  )

  console.log(state);

  // TODO: change to use FormData for prod api
  async function handleSubmit() {
    const result = await postEvent(state);
    if (society)
      router.replace(`/society/${society.id}`)
    console.log(result);
  }

  // Set Society image and title on AppBar 
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
            style={[styles.textInput, !state.title ? styles.invalidInput : {}]}
            onChangeText={(value) => dispatch({ key: 'title', value })}
          />
        </View>

        {/* Text Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>Text*</Text>
          <TextInput
            style={[styles.textInput, !state.text ? styles.invalidInput : {}]}
            multiline={true}
            onChangeText={(value) => dispatch({ key: 'text', value })}
          />
        </View>

        {/* Start Date Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>Start Date*</Text>
          <DateTimePicker
            value={state.startDate}
            onChangeDate={(value) => dispatch({ key: 'startDate', value })} />
        </View>

        {/* End Date Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>End Date</Text>
          <DateTimePicker
            value={state.endDate}
            onChangeDate={(value) => dispatch({ key: 'endDate', value })} />
        </View>

        {/* Media Input */}
        <View style={styles.textContainer} >
          <Text style={styles.label}>End Date</Text>
          <ImagePicker
            onPick={(assets) => {
              const images = assets
                .map(a => a.uri)
                .filter(a => a) as string[];

              dispatch({
                key: 'images',
                value: images
              })
            }}
          />
        </View>

        {/* Submit Button */}
        <View style={styles.textContainer} >
          <Button
            disabled={!isValid}
            onPress={handleSubmit}
            title="submit" />
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
