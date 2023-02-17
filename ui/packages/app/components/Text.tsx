import { Text, TextProps } from 'react-native';

export default function AppText(props: TextProps) { 
  return <Text {...props} 
    style={[{ fontFamily: 'Helvetica' }, props.style]}>
      {props.children}
  </Text>
}
