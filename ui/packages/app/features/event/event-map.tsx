import { H1 } from 'dripsy'
import { ScrollView, View, StyleSheet } from 'react-native'
import EventDetails from './event-draw'

const events: SocietyEvent[] = [
  {
    id: 1,
    title: 'Annual Tour 2023',
    text: `
If you miss this, you will regret it.
If you do this, you will never forget it.
It's a once in a lifetime opportunity to explore the aesthetic beauty of Pakistan. 
So, have you bought your tickets? If not, then what's the hold up? Head over to One-stop since there are only a few tickets remaining!
Details for Tickets:
Venue: One Stop
Timings: 09:00 - 03:30
𝐈𝐌𝐏𝐎𝐑𝐓𝐀𝐍𝐓 𝐈𝐍𝐒𝐓𝐑𝐔𝐂𝐓𝐈𝐎𝐍𝐒:
1) Mode of Payment is 𝐂𝐀𝐒𝐇 𝐎𝐍𝐋𝐘.
2) The tickets are non-refundable.
3) Find the 𝐂𝐨𝐧𝐬𝐞𝐧𝐭 𝐅𝐨𝐫𝐦 attached in the email and get it signed by your Parent/Guardian. It is 𝐌𝐀𝐍𝐃𝐀𝐓𝐎𝐑𝐘 to bring the Consent Form, otherwise, your payment will 𝐍𝐎𝐓 𝐁𝐄 𝐀𝐂𝐂𝐄𝐏𝐓𝐄𝐃. 
4) You are required to bring 𝟏 𝐩𝐡𝐨𝐭𝐨𝐜𝐨𝐩𝐲 𝐨𝐟 𝐲𝐨𝐮𝐫 𝐍𝐔-𝐈𝐃 𝐂𝐚𝐫𝐝 as well as 𝟐 𝐩𝐡𝐨𝐭𝐨𝐜𝐨𝐩𝐢𝐞𝐬 𝐨𝐟 𝐲𝐨𝐮𝐫 𝐂𝐍𝐈𝐂
5) Only limited seats available. 
6) Registrations are on a first come first serve basis, your seat will be confirmed after submitting the payment.
7) Registrations are open for students of all batches.
8)No refunds will be made in case a student leaves the trip during the event.
For further details, you may contact:
Pasha: 03408394669
Ahmed: 03340772139
Wahaj: 03132475602
Fatima: 03333639820
Looking forward to see you all!
`,
    image: 'https://picsum.photos/1280/720',
    startDate: new Date(),
    endDate: new Date(),
    society: {
      id: 1,
      title: 'DECS',
      image: 'https://picsum.photos/200',
      tenure: {
        title: '2022-2023',
      },
    },
  },
  {
    id: 2,
    title: 'Sample Text',
    text: `sample text`,
    image: 'https://picsum.photos/1220/720',
    startDate: new Date(),
    endDate: new Date(),
    society: {
      id: 2,
      title: 'ACM',
      image: 'https://picsum.photos/210',
      tenure: {
        title: '2022-2023',
      },
    },
  },
]

{
  /*MAPPER COMPONENT THAT MAPS ALL EVENT DATA*/
}
export function EventMap() {
  return (
    <ScrollView style={styles.eventWrapper}>
      {/* EVENT MAPPER */}
      {events.map((ev, i) => (
        <EventDetails data={ev} key={i} />
      ))}
    </ScrollView>
  )
}

const styles = StyleSheet.create({
  eventWrapper: {
    width: '100%',
    backgroundColor: '$background',
    flex: 1,
  },
})
