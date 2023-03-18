import { createParam } from 'solito';
import { useEffect, useReducer, useState } from 'react';
import {
  StyleSheet,
  View,
  Text,
  TextInput,
  Button
} from 'react-native'
import { ScrollView } from 'react-native-gesture-handler'
import { useGetSocietyQuery } from '../society/society-api';
import DateTimePicker from 'app/components/DateTimePicker';
import ImagePicker, { ImagePickerAsset } from 'app/components/ImagePicker';
import { useAddEventMutation } from './event-api';
import { useRouter } from 'solito/router';
import { z } from 'zod';
import { toDateString } from 'app/api/util';
import { useSocietyHeader } from 'app/hooks/headers';
import { FormDateInput, FormSubmitButton, FormTextInput } from 'app/components/Form';

const { useParam } = createParam<{ code: string }>()

interface LocalFormState {
  title: string
  text: string
  startDate: Date
  endDate?: Date
  attachments: (File | ImagePickerAsset)[]
}

interface FormState extends LocalFormState, Partial<Event> { }

type FormAction = {
  key: string
  value: LocalFormState[keyof LocalFormState]
}

const eventSchema = z.object({
  title: z.string().min(5),
  text: z.string().min(10),
  startDate: z.date().refine(date => date > new Date(), { message: "Start date must be in the future" }),
  endDate: z.date().optional().refine(date => !date || date > new Date(), { message: "Start date must be in the future" }),
})

export function EventCreateScreen() {
  const [societyCode] = useParam('code');
  const { data: society } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society);

  // Set Society image and title on App Bar 
  useEffect(createHeader)
  if (!society)
    return <EventCreateError />

  return <EventCreateDraw society={society.code} />
}

export function EventCreateDraw({ society }: {
  society: string
}) {
  const [postEvent] = useAddEventMutation();
  const [error, setError] = useState("");
  const router = useRouter();

  const [state, dispatch] = useReducer(
    (prevState: FormState, { key, value }: FormAction) => {
      const data = {
        ...prevState,
        [key]: value
      }

      validate(data)

      return data
    },
    {
      title: '',
      text: '',
      startDate: new Date(),
      endDate: undefined,
      attachments: []
    }
  )

  const validateField = (field: keyof FormState) =>
    (value: unknown): boolean => {
      return eventSchema
        .pick({ [field]: true })
        .safeParse({ [field]: value }).success
    }

  function validate(data: FormState) {
    const parsed = eventSchema
      .refine(data => data.endDate ? data.endDate > data.startDate : true, {
        message: 'End Date must be after Start Date'
      })
      .safeParse(data);

    setError(!parsed.success ? parsed.error.errors[0]?.message ?? "" : "");

    return parsed.success
  }

  async function handleSubmit() {
    if (!validate(state)) return;

    const formData = new FormData();
    formData.append('title', state.title)
    formData.append('text', state.text)
    formData.append('startDate', toDateString(state.startDate));
    state.attachments.forEach(file => {
      formData.append('attachments', file)
    })
    formData.append('society', society)

    const result = await postEvent(formData);
    router.replace(`/society/${society}`)
    console.log('new event', result);
  }


  return (
    <ScrollView style={styles.mainContainer}>

      <View style={styles.titleContainer}>
        <Text style={styles.heading}>Create an Event</Text>

        {/* Title Input */}
        <FormTextInput
          label="Title*"
          subLabel="(min: 5 char)"
          onChangeText={(value) => dispatch({ key: 'title', value })}
          validate={validateField("title")}
        />

        {/* Text Input */}

        <FormTextInput
          label="Text*"
          subLabel="(min: 10 char)"
          multiline
          onChangeText={(value) => dispatch({ key: 'text', value })}
          validate={validateField("text")}
        />

        {/* Start Date Input */}
        <FormDateInput
          label="Start Date*"
          value={state.startDate}
          onChangeDate={(value) => dispatch({ key: 'startDate', value })}
          validate={validateField("startDate")}
        />

        {/* End Date Input */}
        <FormDateInput
          label="End Date"
          value={state.endDate}
          onChangeDate={(value) => dispatch({ key: 'endDate', value })}
          validate={validateField("endDate")} />

        {/* Media Input */}
        <View style={styles.textContainer} >
          <View style={styles.labelContainer}>
            <Text style={styles.label}>Attachments</Text>
            <Text style={styles.subLabel}>(max: 5MB)</Text>
          </View>
          <ImagePicker
            onPick={(assets) => {
              dispatch({
                key: 'attachments',
                value: assets
              })
            }}
          />
        </View>

        {/* Submit Button */}
        <FormSubmitButton
          disabled={error != ""}
          onPress={handleSubmit}
          label="submit" />

        <Text style={{ color: 'red', textAlign: 'center' }}>
          {error}
        </Text>

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
