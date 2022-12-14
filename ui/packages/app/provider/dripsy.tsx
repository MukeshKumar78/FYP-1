import { DripsyProvider, makeTheme } from 'dripsy'
import { useColorScheme } from 'react-native'

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
      fontSize: 16,
      color: '$text' 
    },
    h1: {
      color: '$text' 
    }
  },
  colors: lightColors
})

export const lightTheme = {
  ...theme,
  colors: lightColors,
}

type MyTheme = typeof theme

declare module 'dripsy' {
  interface DripsyCustomTheme extends MyTheme {}
}

export function Dripsy({ children }: { children: React.ReactNode }) {
  const colorScheme = useColorScheme();

  return (
    <DripsyProvider
      theme={theme}
      // this disables SSR, since react-native-web doesn't have support for it (yet)
      ssr
    >
      {children}
    </DripsyProvider>
  )
}
