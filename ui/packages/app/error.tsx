import { View, Text } from 'app/components'
import { Ionicons } from '@expo/vector-icons'

export function Error() {
  return <View style={{ width: '100%', height: '100%', justifyContent: 'center', alignItems: 'center' }}>
    <Ionicons name="warning-outline" size={50} />
    <Text>
      Something went wrong
    </Text>
  </View>
}


