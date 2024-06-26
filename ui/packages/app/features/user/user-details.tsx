import { StyleSheet, Image } from 'react-native'
import { AnimatedLink, Hr, Text, View } from 'app/components'
import { getPublicUri } from 'app/api/util'
import { Ionicons } from '@expo/vector-icons'
import { Error } from 'app/error'
import { Avatar } from 'app/components/Avatar'

export default function UserDetailsOrError({ user }: {
  user: User | undefined | null
}) {

  if (!user)
    return <Error />

  return (
    <View
      style={{ flex: 1, margin: 10, alignItems: 'center' }}
    >
      {user.photo &&
        <Avatar user={user} size={100} />
      }
      <Text style={{ fontSize: 30 }}>{user.firstName} {user.lastName}</Text>
      <Text
        style={{ color: 'gray', textAlign: 'center', marginBottom: 16, fontWeight: 'bold' }}
      >{user.email}</Text>
      <View style={styles.userInfo}>
        <View style={{ width: '100%', }}>
          <Text style={styles.heading}>Memberships</Text>
          <Hr />
          <View>
            {user.memberships && user.memberships.map((m, i) =>
              <MembershipBox data={m} key={i} />
            )}
          </View>
        </View>
      </View>
    </View>
  )
}

function MembershipBox({ data }: {
  data: Membership
}) {
  return <AnimatedLink href={`/society/${data.society.code}`}>
    <View style={{
      borderBottomWidth: 1, borderColor: 'white', borderRadius: 15,
      backgroundColor: '#EFEFEF',
      shadowColor: 'gray', shadowOffset: { width: 0.1, height: 0.1 },
      flexDirection: 'row', flexWrap: 'wrap', padding: 7, margin: 7,
      justifyContent: 'space-between', alignItems: 'center'
    }}>
      <View style={{ flexDirection: 'row', alignItems: 'center' }}>
        <Image
          style={{ margin: 5, width: 50, height: 50, borderRadius: 50 }}
          source={{ uri: getPublicUri(data.society.image) }}
        />
        <View style={{ flexShrink: 1 }}>
          <Text style={{ fontSize: 22 }}>{data.society.fullName}</Text>
          <Text style={{ color: 'gray', fontSize: 14 }}>{data.role}</Text>
        </View>
      </View>
    </View>
  </AnimatedLink>
}

const styles = StyleSheet.create({
  userInfo: {
    flex: 1,
    alignItems: 'center',
    borderRadius: 15,
    paddingTop: 30,
    paddingBottom: 30,
    alignSelf: 'stretch',
    backgroundColor: 'white',
    marginTop: 20,
  },
  heading: {
    fontSize: 28,
    paddingBottom: 2,
    letterSpacing: 2,
    fontWeight: '600',
    textAlign: 'center'
  },
  societyImage: {
    marginRight: 5,
    marginVertical: 5,
    width: 50,
    height: 50,
    borderRadius: 50,
  },
  membershipContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    margin: 10,
    padding: 5,
    backgroundColor: 'white',
    borderRadius: 10,
    shadowColor: 'gray',
    shadowOffset: {
      width: 1,
      height: 1,
    },
    shadowOpacity: 0.5,
    shadowRadius: 2,
    elevation: 1,
  },
  membershipCard: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  membershipContent: {
    marginLeft: '18%',
    marginBottom: 5
  },
  membershipTitle: {
    fontSize: 20,
    fontWeight: '600',
  },
  membershipSubtitle: {
    fontSize: 17,
    fontWeight: '400',
    color: '#777777'
  }

})
