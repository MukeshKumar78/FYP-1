import { View as RNView, StyleSheet, Text as RNText, TextProps, TouchableOpacity, Dimensions, ViewProps, StyleProp, ViewStyle } from 'react-native'
import { ReactNode } from 'react';
import { MotiLink } from 'solito/moti'


export function Hr() {
  return <RNView
    style={{
      borderBottomColor: 'gainsboro',
      borderBottomWidth: StyleSheet.hairlineWidth,
      margin: 10
    }}
  />
}
export function Text(props: TextProps) {
  return <RNText {...props}
    style={[{ fontFamily: 'Raleway', includeFontPadding: false }, props.style]}>
    {props.children}
  </RNText>
}

export function View(props: ViewProps) {
  return <RNView style={{ zIndex: undefined }} {...props}>{props.children}</RNView>
}

export function Button({ text = '', onPress, href, type = 'filled', bordered = false, size, disabled = false, style = {} }: {
  text: string,
  onPress?: () => any
  href?: string,
  type?: 'filled' | 'transparent' | 'outlined'
  bordered?: boolean,
  size?: 'tiny' | 'large' | 'small' | 'full',
  disabled?: boolean
  style?: StyleProp<ViewStyle>
}) {
  const width = Dimensions.get('window').width
  const large = width / 1.3
  const small = width / 2
  let btnSize: number | undefined = undefined;
  if (size === 'full') btnSize = width - 5;
  else if (size === 'large') btnSize = large;
  else if (size === 'small') btnSize = small;

  const btnBgColor = disabled ? 'grey' : type === 'filled' ? '#6677cc' : 'transparent'
  const btnTextColor = type === 'filled' ? '#ffffff' : '#6371c2'
  const btnBorderRadius = bordered ? 30 : 5

  const border = type === 'outlined' ? { borderColor: '#e7e7e7', borderWidth: 2 } : {}

  const button =
    <View style={[styles.btnContainerStyle, {
      ...border,
      backgroundColor: btnBgColor,
      width: btnSize,
      flex: 1,
      borderRadius: btnBorderRadius,
    }, style]}>
      <Text style={[styles.btnTextStyle, { color: btnTextColor, textAlign: 'center' }]}> {text} </Text>
    </View>

  if (disabled)
    return <View style={style}>{button}</View>;

  return (
    <>
      {href
        ? <AnimatedLink style={style} href={href}>{button}</AnimatedLink>
        : <TouchableOpacity style={style} onPress={onPress} activeOpacity={0.7}>{button}</TouchableOpacity>
      }
    </>
  )
}

export function AnimatedLink({ href, children, style }: {
  href: string,
  children: ReactNode
  style?: StyleProp<ViewStyle>
}) {
  return <MotiLink
    style={style}
    href={href}
    animate={({ hovered, pressed }) => {
      'worklet'

      return {
        scale: pressed ? 0.95 : hovered ? 1.01 : 1,
      }
    }}
    from={{
      scale: 0,
    }}
    transition={{
      type: 'timing',
      duration: 100,
    }}
  >
    {children}
  </MotiLink>
}

const styles = StyleSheet.create({
  btnContainerStyle: {
    paddingVertical: 8,
    alignItems: 'center',
  },
  btnTextStyle: {
    lineHeight: 15,
    textAlignVertical: 'bottom',
    justifyContent: 'center'
  }
});
