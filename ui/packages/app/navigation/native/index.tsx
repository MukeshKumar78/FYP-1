import { createNativeStackNavigator } from '@react-navigation/native-stack'
import { createDrawerNavigator } from '@react-navigation/drawer'
import { DrawerActions, useNavigation } from '@react-navigation/native';

import { HomeScreen } from 'app/features/home/screen';
import { LoginScreen } from 'app/features/auth/screen';
import { UserDetailScreen } from 'app/features/user/detail-screen'
import { SettingsScreen } from 'app/features/settings/screen';

import { Image } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { Link } from 'solito/link'

import useAuth from 'app/features/auth/useAuth';
import { useSx } from 'dripsy';
import { LoadingScreen } from 'app/features/loading/screen';
import { ProfileScreen } from 'app/features/user/profile-screen';
import { EventPage } from 'app/features/event/screen';
import { SocietyPage } from 'app/features/society/screen';
import { EventCreate } from 'app/features/event/event-create';

const Stack = createNativeStackNavigator<{
  home: undefined
  'user-detail': {
    code: string
  }
  event: {
    id: string
  }
  society: {
    code: string
  }
  "event-create": {
    code: string
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

function UserButton({ pictureUri, code }: { pictureUri: string | null, code: string | null }) {
  return pictureUri ?
    <Link href={`/user/${code}`}>
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
  const { isSignedIn, loading, user } = useAuth();
  console.log({ isSignedIn, loading, user: user?.email })

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
            headerLeft: () =>
              <UserButton
                pictureUri={user?.photo || null}
                code={user?.code || null}
              />,
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

  if (loading) {
    return <Stack.Navigator>
      <Stack.Screen
        name="loading"
        component={LoadingScreen}
        options={{ headerShown: false }}
      />
    </Stack.Navigator>
  }
  else if (isSignedIn) {
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
      <Stack.Screen
        name="event"
        component={EventPage}
        options={{
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="event-create"
        component={EventCreate}
        options={{
          title: "Create an Event",
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="society"
        component={SocietyPage}
        options={{
          headerTitleAlign: "center",
        }}
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
