import { createParam } from 'solito';
import { useEffect, useReducer, useState } from 'react';
import { Text } from 'app/components'
import { useGetSocietyQuery } from '../society/society-api';
import { ImagePickerAsset } from 'app/components/ImagePicker';
import { useAddEventMutation, useGetEventQuery, useUpdateEventMutation } from './event-api';
import { useRouter } from 'solito/router';
import { z } from 'zod';
import { toDateString } from 'app/api/util';
import { useSocietyHeader } from 'app/hooks/headers';
import { Form, FormDateInput, FormImagePicker, FormSubmitButton, FormTextInput } from 'app/components/Form';
import { EventScreenError } from './screen';

const { useParam } = createParam<{ code: string, id: string }>()

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

export function EventFormScreen() {
  const [societyCode] = useParam('code');
  const [eventId] = useParam('id');

  if (societyCode)
    return <EventCreateDraw society={societyCode} />

  if (eventId && Number(eventId))
    return <EventUpdateDraw event={Number(eventId)} />

  return <EventScreenError />
}

function EventCreateDraw({ society }: {
  society: string
}) {
  const { data } = useGetSocietyQuery(society);
  const { createHeader } = useSocietyHeader(data);

  // Set Society image and title on App Bar 
  useEffect(createHeader)
  if (!data)
    return <EventScreenError />

  return <EventForm society={data} />
}

function EventUpdateDraw({ event }: {
  event: number
}) {
  const { data } = useGetEventQuery(event)

  const { createHeader } = useSocietyHeader(data?.society);
  useEffect(createHeader)

  if (!data)
    return <EventScreenError />

  return <EventForm event={data} />
}

export function EventForm({ society, event }: {
  society?: Society
  event?: SocietyEvent
}) {
  const [postEvent] = useAddEventMutation();
  const [putEvent] = useUpdateEventMutation();
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
      title: event?.title || '',
      text: event?.text || '',
      startDate: event?.startDate ? new Date(event.startDate) : new Date(),
      endDate: event?.endDate ? new Date(event.endDate) : undefined,
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

  async function handleCreate() {
    if (!validate(state) || !society) return;

    const formData = new FormData();
    formData.append('title', state.title)
    formData.append('text', state.text)
    formData.append('startDate', toDateString(state.startDate));
    state.attachments.forEach(file => {
      formData.append('attachments', file)
    })
    formData.append('society', society.code)

    const result = await postEvent(formData);
    // router.back()
    router.replace(`/society/${society.code}`)
    console.log('new event', result);
  }

  async function handleUpdate() {
    if (!validate(state) || !event) return;

    putEvent({
      id: event.id,
      data: {
        title: state.title,
        text: state.text,
        startDate: state.startDate,
        endDate: state.endDate
        // registrationLink: '',
      }
    })
      .unwrap()
      .catch(err => console.error(err))

    router.back()
    // router.replace(`/event/${event.id}`)
  }

  if (!society && !event) {
    return <EventScreenError />
  }

  return (
    <Form>
      <Text>{event ? "Update Event" : "Create an Event"}</Text>

      {/* Title Input */}
      <FormTextInput
        label="Title*"
        subLabel="(min: 5 char)"
        value={state.title}
        onChangeText={(value) => dispatch({ key: 'title', value })}
        validate={validateField("title")}
      />

      {/* Text Input */}
      <FormTextInput
        label="Text*"
        subLabel="(min: 10 char)"
        value={state.text}
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
      {
        !event && <FormImagePicker
          label="Attachments"
          subLabel="(max: 5mb)"
          onPick={(assets) => {
            dispatch({
              key: 'attachments',
              value: assets
            })
          }}
        />
      }

      {/* Submit Button */}
      <FormSubmitButton
        disabled={error != ""}
        onPress={event ? handleUpdate : handleCreate}
        label="submit" />

      <Text style={{ color: 'red', textAlign: 'center' }}>
        {error}
      </Text>
    </Form>
  )
}
