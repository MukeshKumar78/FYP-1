import { AuthProvider } from './auth'
import { Dripsy } from './dripsy'
import { NavigationProvider } from './navigation'

export function Provider({ children }: { children: React.ReactNode }) {

  return (
    <AuthProvider>
      <NavigationProvider>
        <Dripsy>
          {children}
        </Dripsy>
      </NavigationProvider>
    </AuthProvider>
  )
}
