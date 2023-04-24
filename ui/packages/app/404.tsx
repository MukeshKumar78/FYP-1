import { View, Text } from 'app/components'

export function Error404() {
  return <View style={{ width: '100%', height: '100%', justifyContent: 'center', alignItems: 'center' }}>
    <Text style={{ fontSize: 34, fontWeight: 'bold' }}></Text>
    <Text style={{ color: 'gray', fontSize: 18 }}>
      Page Not Found!
    </Text>
  </View>
}
