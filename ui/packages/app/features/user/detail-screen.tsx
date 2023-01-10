import { createParam } from 'solito';
import { useUserQuery } from 'app/api';
import { useNavigation } from '@react-navigation/native';
import { useEffect } from 'react';
import UserDetailsOrError from './user-details';

const { useParam } = createParam<{ id: string }>()


export function UserDetailScreen() {
  const [id] = useParam('id');

  const { data } = useUserQuery(Number(id));

  const navigation = useNavigation();

  useEffect(() => {
    if (data)
      navigation.setOptions({ title: data.firstName })
  }, [data])

  return <UserDetailsOrError user={data}/>

}
