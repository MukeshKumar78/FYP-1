import { View, Text, Image } from 'react-native'
import Constants from 'expo-constants';

function UserErrorPage() {
  return <View>
    <Text
      style={{ textAlign: 'center', marginBottom: 16, fontWeight: 'bold' }}
    >Error loading user</Text>
  </View>
}

export default function UserDetailsOrError({ user }: {
  user: User|undefined|null
}) {

  if (!user)
    return <UserErrorPage />

  return (
    <View
      style={{ flex: 1, margin: 10, alignItems: 'center' }}
    >
      {user.photo &&
        <Image
          style={{ width: 100, height: 100, borderRadius: 50 }}
          source={{ uri: user.photo }}
        />
      }
      <Text style={{ fontSize: 30 }}>{user.firstName} {user.lastName}</Text>
      <Text
        style={{ color: '$muted', textAlign: 'center', marginBottom: 16, fontWeight: 'bold' }}
      >{user.email}</Text>
      <View
        style={{
          flex: 1,
          alignItems: 'center',
          borderRadius: 15,
          paddingTop: 30,
          paddingBottom: 30,
          alignSelf: 'stretch',
          backgroundColor: 'white',
          marginTop: 20,
        }}
      >
        <Text>
          hello
          {Constants.expoConfig?.extra?.fact}
        </Text>
      </View>
    </View>
  )
}
