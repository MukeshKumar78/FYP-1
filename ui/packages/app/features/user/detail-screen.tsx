import { createParam } from 'solito';
import { useUserQuery } from 'app/api';
import { useHeader } from "app/hooks/headers"
import { useEffect } from 'react';
import { H1 } from "app/components";
import UserDetailsOrError from './user-details';
import { useUserHeader } from 'app/hooks/headers';

const { useParam } = createParam<{ code: string }>()


export function UserDetailScreen() {
  const [code] = useParam('code');

  const { data } = useUserQuery(code || '');

  const { createHeader } = useHeader()

  useEffect(() => createHeader(<H1>{data?.firstName} {data?.lastName}</H1>), [])

  return <UserDetailsOrError user={data} />

}
