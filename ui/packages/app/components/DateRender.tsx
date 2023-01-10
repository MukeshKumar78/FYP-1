import { Text } from 'react-native'

const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
]

// HH:MM(AM/PM), DAY MON
export default function DateRender({ date }: {
  date: string|Date
}) {
  if(typeof(date) == 'string') 
    date = new Date(date) 

  const day = date.getDate()
  let mins = date.getMinutes()
  const month = months[date.getMonth()]?.slice(0, 3)
  let hours = date.getHours()
  let MD = 'AM'
  if (hours >= 12) {
    MD = 'PM'

    if (hours > 12) {
      hours = hours - 12
    }
  }

  return <Text>{`${hours}:${mins < 10 ? '0'+mins : mins} ${MD}, ${day} ${month}`}</Text>
}
