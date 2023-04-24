import { createParam } from 'solito';
import { useEffect } from 'react';
import { EventMap } from '../event/event-map';
import { useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { Error } from 'app/error';

const { useParam } = createParam<{ code: string }>()

export function DraftsScreen() {
  const [societyCode] = useParam('code');
  const { data: society, isLoading } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society)

  useEffect(createHeader);

  if (isLoading)
    return <></>

  if (!society)
    return <Error />

  return <>
    <EventMap society={society.code} drafts /></>
}
