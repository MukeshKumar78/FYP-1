import { View, Image } from 'react-native'

export function LoadingScreen() {
  return (
    <View
      style={{
        flex: 1, justifyContent: 'center', alignItems: 'center', padding: 16
      }}
    >
    <Image
      style={{ width: 100, height: 100, borderRadius: 50 }}
      source={{
        uri: 'https://upload.wikimedia.org/wikipedia/commons/1/18/React_Native_Logo.png'
      }}
    />
    </View>
  )
}
