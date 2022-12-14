import { View, H1 } from 'dripsy'

export function HomeScreen() {

  return (
    <View
      sx={{ 
        backgroundColor: "$background", 
        flex: 1, 
        justifyContent: 'center', 
        alignItems: 'center', 
       }}
    >
      <H1 sx={{ color: "$text", fontWeight: '800' }}>Home.</H1>
      <View sx={{ height: 32 }} />

    </View>
  )
}
