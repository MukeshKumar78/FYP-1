import { View, StyleSheet, Text, Image } from 'react-native'
import { Ionicons } from '@expo/vector-icons'
import { Link } from 'solito/link'
import { getPublicUri } from 'app/api/util'

function UserErrorPage() {
  return <View>
    <Text
      style={{ textAlign: 'center', marginBottom: 16, fontWeight: 'bold' }}
    >Error loading user</Text>
  </View>
}

export default function UserDetailsOrError({ user }: {
  user: User | undefined | null
}) {

  if (!user)
    return <UserErrorPage />

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
          <View style={styles.headingContainer}>
            <Text style={styles.heading}>Memberships</Text>
          </View>
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
    <Link href={`/society/${data.society.code}`}>
      <View style={styles.membershipContainer}>
        <View style={styles.membershipCard}>
          <Image
            style={styles.societyImage}
            source={{ uri: getPublicUri(data.society.image) }}
          />
          <Text style={styles.membershipTitle}>{data.society.fullName}</Text>
        </View>
        <View style={styles.membershipContent}>
          <Text style={[styles.membershipSubtitle, { fontStyle: 'italic' }]}>Example Team</Text>
          <Text style={styles.membershipSubtitle}>as {data.role}</Text>
        </View>
        <Ionicons name="arrow-forward" size={25} style={{ color: '#696969', position: 'absolute', right: 5, bottom: 5 }} />
      </View>
    </Link>
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
  headingContainer: {
    borderColor: 'gainsboro',
    borderBottomWidth: StyleSheet.hairlineWidth,
    width: '100%',
  },
  societyImage: {
    marginRight: 5,
    marginVertical: 5,
    width: 50,
    height: 50,
    borderRadius: 50,
  },
  membershipContainer: {
    margin: 10,
    padding: 10,
    backgroundColor: 'white',
    borderRadius: 10,
    shadowColor: 'gray',
    shadowOffset: {
      width: 2,
      height: 2,
    },
    shadowOpacity: 0.5,
    shadowRadius: 3,
    elevation: 10,
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
  }

})
