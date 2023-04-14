import { z } from 'zod'
import client from './redis';
import fcm from './fcm'

const messageSchema = z.object({
  users: z.array(z.string()),
  notification: z.object({
    title: z.string(),
    body: z.string()
  })
});

type Message = z.infer<typeof messageSchema>

(async () => {
  const subscriber = client.duplicate()

  await client.connect()
  await subscriber.connect()

  await subscriber.subscribe('push-notifications', async (payload: string) => {
    const message: Message = parseMessage(payload)
    const parsed = messageSchema.safeParse(message)

    if (!parsed.success) {
      return console.error(parsed.error)
    }

    const tokens = (await Promise.all(message.users.map(async (user) => await client.hGet(`user:${user}`, 'token'))))
      .filter(Boolean) as string[];

    try {
      await fcm.messaging().sendMulticast({ tokens, notification: message.notification })
    } catch (e) {
      console.log("failed to send:", message)
    }
  })
})()

function parseMessage(message: string) {
  try {
    return JSON.parse(message);
  } catch (ex) {
    return null;
  }
}
