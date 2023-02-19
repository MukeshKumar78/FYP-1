import { NavigationProvider } from './navigation'
import store from 'app/api/store';
import { Provider as ReduxProvider } from 'react-redux';
import { GoogleProvider } from './google';

export function Provider({ children }: { children: React.ReactNode }) {

  return (
    <NavigationProvider>
      <GoogleProvider>
        <ReduxProvider store={store}>
          {children}
        </ReduxProvider>
      </GoogleProvider>
    </NavigationProvider>
  )
}
