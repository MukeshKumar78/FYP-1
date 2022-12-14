import { View, Image } from 'dripsy'

export function LoadingScreen() {
  return (
    <View
      sx={{
        flex: 1, justifyContent: 'center', alignItems: 'center', p: 16, backgroundColor: '$background'
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
