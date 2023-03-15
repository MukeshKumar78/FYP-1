import { createParam } from 'solito';
import { useUserQuery } from 'app/api';
import { useEffect } from 'react';
import UserDetailsOrError from './user-details';
import { useUserHeader } from 'app/hooks/headers';

const { useParam } = createParam<{ code: string }>()


export function UserDetailScreen() {
  const [code] = useParam('code');

  const { data } = useUserQuery(code || '');

  const { createHeader } = useUserHeader(data);

  useEffect(createHeader);

  return <UserDetailsOrError user={data}/>

}
