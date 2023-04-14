import { NativeNavigation } from 'app/navigation/native'
import { Provider } from 'app/provider'
import { useEffect } from 'react';
import { StatusBar } from 'react-native'
import { useFonts } from 'expo-font';
import * as Notifications from 'expo-notifications';
import * as SQLite from 'expo-sqlite';
import { Notification } from 'expo-notifications';

const db = SQLite.openDatabase('campusme.db');

Notifications.setNotificationHandler(null);

function saveNotification(notification: Notification) {
  db.exec([{
    sql: "INSERT INTO notifications (title, body) values (?, ?);",
    args: [notification.request.content.title, notification.request.content.body]
  }],
    false,
    () => console.log('add to db', notification.request.content)
  )
}

export default function App() {
  const [fontsLoaded] = useFonts({
    'Raleway': require('./assets/fonts/Raleway-Regular.ttf'),
  });

  const lastNotificationResponse = Notifications.useLastNotificationResponse();

  console.log(lastNotificationResponse)

  useEffect(() => {
    db.exec([{ sql: 'CREATE TABLE IF NOT EXISTS notifications (title TEXT, body TEXT)', args: [] }], false, () => {

    })
    StatusBar.setBarStyle('dark-content', false)


    /* Not working on development builds */
    // Notifications.addNotificationReceivedListener(saveNotification)
    // Notifications.addNotificationResponseReceivedListener(r => saveNotification(r.notification))
  }, [])


  return (
    <>
      <StatusBar
        barStyle={'dark-content'}
        backgroundColor={'black'}
      />
      <Provider>
        <NativeNavigation />
      </Provider>
    </>
  )
}
