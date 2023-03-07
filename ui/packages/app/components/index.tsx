import { View as RNView, StyleSheet, Text as RNText, TextProps, TouchableOpacity, Dimensions, ViewProps } from 'react-native'
import { ReactNode } from 'react';
import { MotiLink } from 'solito/moti'

const width = Dimensions.get('window').width

export function Hr() {
  return <RNView
    style={{
      borderBottomColor: 'gray',
      borderBottomWidth: StyleSheet.hairlineWidth,
      margin: 10
    }}
  />
}
export function Text(props: TextProps) { 
  return <RNText {...props} 
    style={[{ fontFamily: 'Helvetica' }, props.style]}>
      {props.children}
  </RNText>
}

export function View(props: ViewProps) {
  return <RNView {...props}>{props.children}</RNView>
}

export function Button({ text = '', onPress, href, type = 'filled', bordered = false, size = 'large', disabled = false}: {
  text: string,
  onPress?: () => any
  href?: string,
  type?: 'filled' | 'transparent' | 'outlined'
  bordered?: boolean,
  size?: 'large' | 'small' | 'full',
  disabled?: boolean
}) {
  const large = width / 1.3
  const small = width / 2
  const btnSize = size === 'large' ? large : size == 'full' ? width - 5 : small
  const btnBgColor = disabled ? 'grey' : type === 'filled' ? '#6677cc' : 'transparent'
  const btnTextColor = type === 'filled' ? '#ffffff' : '#6371c2'
  const btnBorderRadius = bordered ? 30 : 5

  const border = type === 'outlined' ? { borderColor: '#e7e7e7', borderWidth: 2 } : {}

  const button = 
      <View style={[styles.btnContainerStyle, {
        ...border,
        backgroundColor: btnBgColor,
        width: btnSize,
        borderRadius: btnBorderRadius,
      }]}>
        <Text style={[styles.btnTextStyle, { color: btnTextColor }]}> {text} </Text>
      </View>

  if(disabled)
    return button;

  return (
    <>
      { href
      ? <AnimatedLink href={href}>{button}</AnimatedLink>
      : <TouchableOpacity onPress={onPress} activeOpacity={0.7}>{button}</TouchableOpacity>
      }
    </>
  )
}

export function AnimatedLink({ href, children }: {
  href: string,
  children: ReactNode
}) {
  return <MotiLink
    href={href}
    animate={({ hovered, pressed }) => {
      'worklet'

      return {
        scale: pressed ? 0.95 : hovered ? 1.1 : 1,
        rotateZ: pressed ? '0deg' : hovered ? '-3deg' : '0deg',
      }
    }}
    from={{
      scale: 0,
      rotateZ: '0deg',
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
    alignItems: 'center'
  },
  btnTextStyle: {
    fontSize: 16,
    fontFamily: 'Quicksand-Medium'
  }
});
