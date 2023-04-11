import {
  Image,
  StyleSheet,
  TouchableOpacity,
} from 'react-native'
import { Text, View, Button, Hr } from 'app/components'
import { getPublicUri } from 'app/api/util';
import { useMembership, usePermissions } from '../auth/hooks';

export function SocietyInfo({ society }: {
  society: Society
}) {

  const [canCreateEvent] = usePermissions(society.code, ["EVENT_CREATE"])
  const membership = useMembership(society.code);

  return (
    <View
      style={{ margin: 10, alignItems: 'center' }}
    >
      <Image
        style={{ width: 120, height: 120, borderRadius: 60 }}
        source={{ uri: getPublicUri(society.image) }}
      />
      <Text style={{ fontSize: 30, fontWeight: '600' }}>{society.name}</Text>
      <Text style={{ fontSize: 22 }}> {society.fullName}</Text>
      <Text
        style={{ color: 'gray', textAlign: 'center', marginBottom: 16, fontWeight: 'bold' }}
      >{society.description}</Text>
      {/*SOCIETY DESCRIPTION + EDITSOCIETY + CREATEEVENT CONTAINER*/}
      <Hr />
      <View style={styles.buttonsContainer}>
        {
          membership && (
            <Button href={`/society/${society.code}/edit`} text="Edit" style={{ minWidth: 100 }} />
          )
        }
        {
          canCreateEvent &&
          <Button href={`/society/${society.code}/new-event`} text="New Event" style={{ minWidth: 100 }} />
        }
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  infoContainer: {
    borderColor: 'blue',
    marginBottom: '5%',
    flexDirection: 'row',
  },
  imageContainer: {
    flex: 1,
    width: '100%',
    height: 'auto',
  },
  profilePicture: {
    borderRadius: 500,
    aspectRatio: 1,
    justifyContent: 'center',
  },
  allNamesContainer: {
    flex: 2,
    borderColor: 'green',
    justifyContent: 'space-between',
  },
  nameButtonContainer: {
    marginTop: '5%',
    marginLeft: '8.5%',
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'space-between',
  },

  societyNameShort: {
    fontSize: 35,
    fontWeight: 'bold',
  },
  followButtonContainer: {
    borderColor: 'red',
    justifyContent: 'center',
  },
  followButton: {
    height: 25,
    aspectRatio: 1,
    opacity: 0.4,
  },
  societyfullName: {
    fontStyle: 'italic',
    marginLeft: '8.5%',
    fontWeight: 'bold',
  },

  descNfuncsContainer: {
    borderColor: '#DCDCDC',
    flex: 1,
  },
  societyDescription: {
    opacity: 0.85,
    fontSize: 13,
    marginBottom: '3.5%',
  },
  buttonsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    width: '100%',
    justifyContent: 'space-evenly',
  },
  functionalButton: {
    borderWidth: 1.5,
    borderRadius: 25,
    borderColor: '#909090',
    textAlign: 'center',
    color: '#696969',
    paddingHorizontal: '10%',
    lineHeight: 30,
  },
})
