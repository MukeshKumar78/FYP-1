import { useAuth } from 'app/features/auth/hooks';
import UserDetailsOrError from './user-details';


export function ProfileScreen() {
  const { user } = useAuth();

  return <UserDetailsOrError user={user}/>
}
