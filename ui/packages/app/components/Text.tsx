import { Text, TextProps } from 'react-native';

export default (props: TextProps) => 
  <Text {...props} 
    style={[{ fontFamily: 'Helvetica' }, props.style]}>
      {props.children}
  </Text>
