import { OptionsModalButton, Option } from 'app/components/OptionsModalButton';
import { useMembership, usePermissions } from '../auth/hooks';
import { usePublishEventMutation } from './event-api';

export default function EventOptionsModal({ event }: {
  event: SocietyEvent
}) {
  const [canEdit, canPublish] = usePermissions(event.society.code, ["EVENT_UPDATE", "EVENT_PUBLISH"])
  const membership = useMembership(event.society.code)

  const [publishEvent] = usePublishEventMutation();

  function publish() {
    publishEvent(event.id)
      .unwrap()
      .catch(console.error)
  }

  return <OptionsModalButton>
    {
      canEdit && <Option text="Edit" href={`/event/${event.id}/edit`} />
    }
    {
      !event.published && canPublish && <Option text="Publish" onPress={publish} />
    }
    {
      event.published && membership && <Option text="View History" href={`/event/${event.id}/history`} />
    }
  </OptionsModalButton>
}

