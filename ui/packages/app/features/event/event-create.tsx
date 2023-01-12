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
import ImagePicker, { ImagePickerAsset } from 'app/components/ImagePicker';
import { useAddEventMutation } from './event-api';
import { useRouter } from 'solito/router';
import { z } from 'zod';
import { toDateString } from 'app/api/util';

const { useParam } = createParam<{ id: string }>()

interface FormState extends Partial<Event> {
  title: string
  text: string
  startDate: Date
  endDate?: Date
  attachments?: ImagePickerAsset[]
}

type FormAction = {
  key: string
  value: string | Date | ImagePickerAsset[]
}

const eventSchema = z.object({
  title: z.string().min(5),
  text: z.string().min(10),
  startDate: z.date().min(new Date()),
  endDate: z.date().min(new Date()).optional(),
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
      if (parsed.success) {
        setIsValid(true);
      }
      else {
        setIsValid(false);
      }
      return data;
    },
    {
      title: '',
      text: '',
      startDate: new Date(),
      endDate: undefined,
      attachments: []
    }
  )

  // TODO: change to use FormData for prod api
  async function handleSubmit() {
    const formData = new FormData();
    formData.append('title', state.title)
    formData.append('text', state.text)
    formData.append('startDate', toDateString(state.startDate));
    state.attachments?.forEach(a => {
      if (a.type && a.fileName && a.uri)
        formData.append('attachments', { type: a.type, name: a.fileName, uri: a.uri })
    })

    if (society) {
      const result = await postEvent([society.id, formData]);
      router.replace(`/society/${society.id}`)
      console.log(result);
    }
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
          <View style={styles.labelContainer}>
            <Text style={styles.label}>Title* </Text>
            <Text style={styles.subLabel}>(min: 5 char)</Text>
          </View>
          <TextInput
            style={[styles.textInput, !state.title ? styles.invalidInput : {}]}
            onChangeText={(value) => dispatch({ key: 'title', value })}
          />
        </View>

        {/* Text Input */}
        <View style={styles.textContainer} >
          <View style={styles.labelContainer}>
            <Text style={styles.label}>Text* </Text>
            <Text style={styles.subLabel}>(min: 10 char)</Text>
          </View>
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
          <View style={styles.labelContainer}>
            <Text style={styles.label}>Attachments</Text>
            <Text style={styles.subLabel}>(max: 5MB)</Text>
          </View>
          <ImagePicker
            onPick={(assets) => {
              // const attachments = assets
              //   .map(a => a.uri)
              //   .filter(a => a) as string[];

              dispatch({
                key: 'attachments',
                value: assets
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
