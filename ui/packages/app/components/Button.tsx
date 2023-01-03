import { Pressable, PressableProps, Text, StyleSheet, ViewStyle, StyleProp, GestureResponderEvent, View } from 'react-native';

export default function Button(props: {
  onPress: (event: GestureResponderEvent) => void,
  title: string,
  style?: StyleProp<ViewStyle>
}) {
  const { onPress, title = 'Save', style = {} } = props;
  return (
    <Pressable style={[styles.button, style]} onPress={onPress}>
      <Text style={styles.text}>{title}</Text>
    </Pressable>
  );
}

export function ButtonWithChildren(props: PressableProps ) {
  return (
    <Pressable {...props} style={[styles.button, props.style as StyleProp<ViewStyle>]}>
      {props.children}
    </Pressable>
  );
}

const styles = StyleSheet.create({
  button: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 12,
    borderRadius: 0,
    elevation: 3,
    backgroundColor: 'white',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 1,
    },
    shadowOpacity: 0.1,
    shadowRadius: 1,
  },
  text: {
    fontSize: 15,
    lineHeight: 21,
    fontWeight: 'bold',
    letterSpacing: 0.25,
    color: 'black',
  },
});
