import { createParam } from 'solito';
import { useEffect } from 'react';
import { EventMap } from '../event/event-map';
import { useGetSocietyQuery } from './society-api';
import { useSocietyHeader } from '../../hooks/headers'
import { SocietyScreenError } from './screen';

const { useParam } = createParam<{ code: string }>()

export function DraftsScreen() {
  const [societyCode] = useParam('code');
  const { data: society, isLoading } = useGetSocietyQuery(societyCode || '');
  const { createHeader } = useSocietyHeader(society)

  useEffect(createHeader);

  if (isLoading)
    return <></>

  if (!society)
    return <SocietyScreenError />

  return <>
    <EventMap society={society.code} drafts /></>
}
