import { createNativeStackNavigator } from '@react-navigation/native-stack'
import { createDrawerNavigator } from '@react-navigation/drawer'
import { DrawerActions, useNavigation } from '@react-navigation/native';

import { HomeScreen } from 'app/features/home/screen';
import { LoginScreen } from 'app/features/login/screen';
import { UserDetailScreen } from 'app/features/user/detail-screen'
import { SettingsScreen } from 'app/features/settings/screen';

import { Image } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Link } from 'solito/link'

import useAuth from 'app/provider/auth/useAuth';
import { useSx } from 'dripsy';
import { LoadingScreen } from 'app/features/loading/screen';
import { ProfileScreen } from 'app/features/user/profile';

const Stack = createNativeStackNavigator<{
  home: undefined
  'user-detail': {
    id: string
  }
  login: undefined
  loading: undefined
}>()

const Drawer = createDrawerNavigator<{
  homeScreen: undefined
  profile: {
    id: string
  }
  settings: undefined
  logout: undefined
}>();

function LogoTitle() {
  return (
    <Image
      style={{ width: 40, height: 40, borderRadius: 50 }}
      source={{
        uri: 'https://upload.wikimedia.org/wikipedia/commons/1/18/React_Native_Logo.png'
      }}
    />
  );
}

function UserButton({ pictureUri }: { pictureUri: string | null }) {
  return pictureUri ?
    <Link href='/user/1'>
      <Image
        style={{ margin: 10, width: 40, height: 40, borderRadius: 50 }}
        source={{ uri: pictureUri }}
      />
    </Link>
    : <></>
}

function SidebarButton() {
  const navigation = useNavigation();
  const sx = useSx();

  function openSidebar() {
    navigation.dispatch(DrawerActions.openDrawer());
  }

  return (
    <Ionicons name="md-menu" size={32} color="black"
      style={sx({ margin: 10, color: '$text' })}
      onPress={openSidebar}
    />
  )
}

export function NativeNavigation() {
  const { isSignedIn, loading, userInfo } = useAuth();
  console.log("loading:", loading)

  function DrawerNavigator() {
    return (
      <Drawer.Navigator
        screenOptions={{ 
          drawerPosition: "right", 
          drawerType: "slide", 
          headerTitleAlign: 'left',
          headerLeft: () => null,
          headerRight: () => <SidebarButton />
        }}
      >
        <Drawer.Screen
          name="homeScreen"
          component={HomeScreen}
          options={{
            title: "Home",
            headerTitle: () => <LogoTitle />,
            headerTitleAlign: "center",
            headerLeft: () => <UserButton pictureUri={userInfo?.user.photo || null} />,
          }}
        />
        <Drawer.Screen
          name="profile"
          component={ProfileScreen}
          options={{ title: "Profile" }}
        />
        <Drawer.Screen
          name="settings"
          component={SettingsScreen}
          options={{ title: "Settings" }}
        />
        <Drawer.Screen
          name="logout"
          component={LoginScreen}
          options={{ title: "Logout" }}
        />
      </Drawer.Navigator>
    )
  }

  if(loading) {
    return <Stack.Navigator>
      <Stack.Screen
        name="loading"
        component={LoadingScreen}
        options={{ headerShown: false }}
      />
    </Stack.Navigator>
  }
  else if(isSignedIn) {
    return <Stack.Navigator>
      <Stack.Screen
        name="home"
        component={DrawerNavigator}
        options={{ 
          headerShown: false
        }}
      />
      <Stack.Screen
        name="user-detail"
        component={UserDetailScreen}
        options={{ title: "User" }}
      />
    </Stack.Navigator>
  }
  else {
    return <Stack.Navigator>
      <Stack.Screen
        name="login"
        component={LoginScreen}
        options={{
          title: 'Login',
        }}
      />
    </Stack.Navigator>
  }
}
