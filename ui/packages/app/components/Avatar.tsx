import { Image } from 'react-native'
import { getPublicUri } from 'app/api/util'
import { useState } from 'react'
import { Link } from 'solito/link'

export function Avatar({ user, size = 35 }: {
  user: User | null,
  size?: number
}) {

  const [uri, setUri] = useState(user?.photo)

  return <Link href={user ? `/user/${user.code}` : '#'}>
    <Image
      style={{ width: size, height: size, borderRadius: 50 }}
      source={{ uri: getPublicUri(uri) }}
      onError={() => {
        setUri(`https://ui-avatars.com/api/?color=fff&name=${user?.firstName || 'U'}&length=3`)
      }}
    />
  </Link>
}
