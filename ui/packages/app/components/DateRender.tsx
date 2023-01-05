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
export default function CustomDate({ date }) {
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

  if (mins < 10) {
    mins = '0' + mins
  }

  //const final = hours + ':' + mins + ' ' + MD + ', ' + day + ' ' + month
  //return <Text>{final}</Text>

  //const final = `${hours}:${mins} ${MD}, ${day} ${month}`;
  //console.log(month)
  return <Text>{`${hours}:${mins} ${MD}, ${day} ${month}`}</Text>
}
