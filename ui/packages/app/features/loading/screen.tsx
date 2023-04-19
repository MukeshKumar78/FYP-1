import { View, Image } from 'react-native'

export function LoadingScreen() {
  return (
    <View
      style={{
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 16,
      }}
    >
      <Image
        style={{ width: 267, height: 150, borderRadius: 10 }}
        source={require('../../assets/logoW.png')}
      />
    </View>
  )
}
