import { useAuth } from 'app/features/auth/hooks';
import { useHeader } from "app/hooks/headers"
import { useEffect } from 'react';
import UserDetailsOrError from './user-details';
import { H1 } from "app/components";


export function ProfileScreen() {
  const { user } = useAuth();

  const { createHeader } = useHeader()

  useEffect(() => createHeader(<H1>Profile</H1>), [])

  return <UserDetailsOrError user={user} />
}
