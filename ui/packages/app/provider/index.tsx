import { Dripsy } from './dripsy'
import { NavigationProvider } from './navigation'
import store from 'app/api/store';
import { Provider as ReduxProvider } from 'react-redux';

export function Provider({ children }: { children: React.ReactNode }) {

  return (
    <NavigationProvider>
      <ReduxProvider store={store}>
        <Dripsy>
          {children}
        </Dripsy>
      </ReduxProvider>
    </NavigationProvider>
  )
}
