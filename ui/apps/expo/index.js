import { registerRootComponent } from 'expo'
import { GoogleSignin } from '@react-native-google-signin/google-signin';

GoogleSignin.configure({
  webClientId: "570750294495-agp39a9o29sc3ce3l3ik87m2ckfjeia2.apps.googleusercontent.com",
  offlineAccess: false,
});



import * as encoding from 'text-encoding';
import App from './App'

// registerRootComponent calls AppRegistry.registerComponent('main', () => App);
// It also ensures that whether you load the app in Expo Go or in a native build,
// the environment is set up appropriately
registerRootComponent(App)
