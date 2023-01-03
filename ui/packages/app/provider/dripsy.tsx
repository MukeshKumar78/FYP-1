import { DripsyProvider, makeTheme } from 'dripsy'
import { Dimensions, useColorScheme } from 'react-native'

const win = Dimensions.get('window');

const darkColors = {
  $background: '#121212',
  $text: 'white',
  $muted: 'gray'
}

const lightColors: typeof darkColors = {
  ...darkColors,
  $background: 'white',
  $text: 'black',
}

export const theme = makeTheme({
  text: {
    p: {
      fontFamily: 'Open Sans',
      fontSize: 16,
      color: '$text'
    },
    h1: {
      color: '$text'
    },
  },
  layout: {
    wide: {
      width: undefined,
      height: undefined,
      flex: 1,
    },
    card: {
      backgroundColor: '$background',
      padding: 4,
      margin: 2,
      justifyContent: 'center',
      alignContent: 'center',
      borderRadius: 5,
      shadowColor: '#000',
      shadowOffset: {
        width: 0,
        height: 2,
      },
      shadowOpacity: 0.25,
      shadowRadius: 3.84,
      elevation: 5,
    }
  }
})

export const lightTheme = {
  ...theme,
  colors: lightColors,
}

type MyTheme = typeof theme

declare module 'dripsy' {
  interface DripsyCustomTheme extends MyTheme { }
}

export function Dripsy({ children }: { children: React.ReactNode }) {
  const colorScheme = useColorScheme();

  return (
    <DripsyProvider
      theme={lightTheme}
      // this disables SSR, since react-native-web doesn't have support for it (yet)
      ssr
    >
      {children}
    </DripsyProvider>
  )
}
