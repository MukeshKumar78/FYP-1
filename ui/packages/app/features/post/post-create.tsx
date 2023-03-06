import { createParam } from 'solito';
import {  useReducer, useState } from 'react';
import {
  StyleSheet,
  View,
  Text,
  TextInput,
} from 'react-native'
import { Button } from 'app/components/Button'
import { ScrollView } from 'react-native-gesture-handler'
import ImagePicker, { ImagePickerAsset } from 'app/components/ImagePicker';
import { useAddPostMutation } from './post-api';
import { useRouter } from 'solito/router';
import { z } from 'zod';

const { useParam } = createParam<{ eventId: string }>()

interface LocalFormState {
  title: string
  text: string
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
})

export function PostCreateScreen() {
  const [eventId] = useParam('eventId');

  if(!eventId)
    return <PostCreateError/>

  return <PostCreateDraw eventId={eventId}/>
}

function PostCreateDraw({ eventId }: {
  eventId: string
}) {
  const [addPost] = useAddPostMutation();
  const [isValid, setIsValid] = useState(false);
  // const { createHeader } = useSocietyHeader(society);
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
      attachments: []
    }
  )

  async function handleSubmit() {
    const formData = new FormData();
    formData.append('title', state.title)
    formData.append('text', state.text)
    state.attachments.forEach(file => {
      formData.append('attachments', file)
    })
    formData.append('event', eventId)

    const result = await addPost(formData);
    router.replace(`/event/${eventId}`)
    console.log('new post', result);
  }

  return (
    <ScrollView style={styles.mainContainer}>

      <View style={styles.titleContainer}>
        <Text style={styles.heading}>Create a Post</Text>

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
        <View style={styles.submitContainer} >
          <Button
            disabled={!isValid}
            onPress={handleSubmit}
            text="submit" />
        </View>

      </View>
    </ScrollView>
  )
}

function PostCreateError() {
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
  submitContainer: {
    alignItems: 'center'
  },
  imageContainer: {},
})
