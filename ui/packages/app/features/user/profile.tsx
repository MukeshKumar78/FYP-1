import { View, Text, Image, H1 } from 'dripsy'
import { useEffect } from 'react';

import useAuth from 'app/provider/auth/useAuth';
import { useNavigation } from '@react-navigation/native';


export function ProfileScreen() {
  const { userInfo } = useAuth();
  const navigation = useNavigation();

  if(!userInfo?.user) 
    return <View>
      <Text
        sx={{ textAlign: 'center', mb: 16, fontWeight: 'bold' }}
      >Failed to load profile</Text>
    </View>

  return (
    <View 
      sx={{ flex: 1, margin: 10, alignItems: 'center' }}
    >
      {userInfo.user.photo &&
        <Image 
          style={{ width: 100, height: 100, borderRadius: 50 }}
          source={{ uri: userInfo.user.photo }} 
        />
      }
      <H1 style={{fontSize: 30}}>{userInfo.user.name}</H1>
      <Text
        sx={{ color: '$muted',textAlign: 'center', mb: 16, fontWeight: 'bold' }}
      >{userInfo?.user.email}</Text>
      <View
        style={{
          flex: 1,
          alignItems: 'center',
          borderRadius: 15,
          paddingTop: 30,
          paddingBottom: 30,
          alignSelf: 'stretch',
          backgroundColor: 'white',
          marginTop: 20,
        }}
      >
        <Text style={{margin: 10}}>sussy</Text>
      </View>
    </View>
  )
}
