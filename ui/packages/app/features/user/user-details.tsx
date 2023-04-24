import { StyleSheet, Image } from 'react-native'
import { AnimatedLink, Hr, Text, View } from 'app/components'
import { getPublicUri } from 'app/api/util'
import { Error } from 'app/error'

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
        <Image
          style={{ width: 100, height: 100, borderRadius: 50 }}
          source={{ uri: getPublicUri(user.photo) }}
        />
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
  return <View>
    <AnimatedLink href={`/society/${data.society.code}`}>
      <View style={styles.membershipContainer}>
        <Image
          style={styles.societyImage}
          source={{ uri: getPublicUri(data.society.image) }}
        />
        <View style={styles.membershipCard}>
          <View style={{ borderRightWidth: 1, borderRightColor: 'gainsboro', marginRight: 5 }}>
            <Text style={styles.membershipTitle}>{data.society.fullName} </Text>
          </View>
          <Text style={[styles.membershipSubtitle]}>Example Team • </Text>
          <Text style={styles.membershipSubtitle}>{data.role}</Text>
        </View>
        {/* <Ionicons name="arrow-forward" size={25} style={{ color: '#696969', position: 'absolute', right: 5, bottom: 5 }} /> */}
      </View>
    </AnimatedLink>
  </View>
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
