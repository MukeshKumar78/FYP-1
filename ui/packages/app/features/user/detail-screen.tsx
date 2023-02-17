import { createParam } from 'solito';
import { useUserQuery } from 'app/api';
import { useNavigation } from '@react-navigation/native';
import { useEffect } from 'react';
import UserDetailsOrError from './user-details';

const { useParam } = createParam<{ code: string }>()


export function UserDetailScreen() {
  const [code] = useParam('code');

  const { data } = useUserQuery(code || '');

  const navigation = useNavigation();

  useEffect(() => {
    if (data)
      navigation.setOptions({ title: data.firstName + ' ' + data.lastName })
  }, [data, navigation])

  return <UserDetailsOrError user={data}/>

}
