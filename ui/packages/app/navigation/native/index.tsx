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

import { useAuth } from 'app/features/auth/hooks';
import { LoadingScreen } from 'app/features/loading/screen';
import { ProfileScreen } from 'app/features/user/profile-screen';
import { EventScreen } from 'app/features/event/screen';
import { SocietyPage } from 'app/features/society/screen';
import { EventFormScreen } from 'app/features/event/event-form';
import { SocietyEditScreen } from 'app/features/society/edit-screen';
import { TeamEditScreen } from 'app/features/team/edit-screen';
import { CommentScreen } from 'app/features/comment/screen';
import { PostCreateScreen } from 'app/features/post/post-create';
import { DraftsScreen } from 'app/features/society/drafts-screen';
import { EventHistoryScreen } from 'app/features/event/event-history';
import { EventSearchScreen } from 'app/features/event/event-search';
import TeamChatsMapScreen from '../../../../apps/next/pages/team/chats';
import TeamChatScreen from '../../../../apps/next/pages/team/chats/[code]';

const Stack = createNativeStackNavigator<{
  home: undefined
  'user-detail': {
    code: string
  }
  event: {
    id: string
  }
  "event-history": {
    id: string
  }
  comments: {
    id: string
  }
  society: {
    code: string
  }
  "edit-society": {
    code: string
  }
  "edit-team": {
    code: string
  }
  "team-chat": {
    code: string
  }
  "event-create": {
    code: string
  }
  "event-update": {
    id: string
  }
  "post-create": {
    id: string
  }
  drafts: {
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
  "team-chats": undefined,
  "event-search": undefined
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
  function openSidebar() {
    navigation.dispatch(DrawerActions.openDrawer());
  }

  return (
    <Ionicons name="md-menu" size={32} color="black"
      style={{ margin: 10 }}
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
          name="event-search"
          component={EventSearchScreen}
          options={{ title: "Search" }}
        />
        <Drawer.Screen
          name="team-chats"
          component={TeamChatsMapScreen}
          options={{ title: "Chats" }}
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
        component={EventScreen}
        options={{
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="event-history"
        component={EventHistoryScreen}
        options={{
          headerTitle: "Event History",
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="comments"
        component={CommentScreen}
        options={{
          headerTitleAlign: "center",
          title: "Comments"
        }}
      />
      <Stack.Screen
        name="event-create"
        component={EventFormScreen}
        options={{
          title: "Create an Event",
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="event-update"
        component={EventFormScreen}
        options={{
          title: "Update Event",
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="post-create"
        component={PostCreateScreen}
        options={{
          title: "Create a Post",
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
      <Stack.Screen
        name="drafts"
        component={DraftsScreen}
        options={{
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="edit-society"
        component={SocietyEditScreen}
        options={{
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="edit-team"
        component={TeamEditScreen}
        options={{
          headerTitleAlign: "center",
        }}
      />
      <Stack.Screen
        name="team-chat"
        component={TeamChatScreen}
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
