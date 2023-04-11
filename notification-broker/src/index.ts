import client from './redis';

(async () => {
  const subscriber = client.duplicate()

  await subscriber.connect()

  await subscriber.subscribe('push-notifications', (message: string) => {
    try {
      const notification = JSON.parse(message)
      console.log(notification);
    } catch (e) {
      console.log("failed to parse:", message)
    }
  })
})()
