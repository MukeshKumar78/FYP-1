import { ScaledImage } from 'app/components/ScaledImage'
import { H1, View as DView } from 'dripsy'
import {
  Image,
  StyleSheet,
  View,
  TextInput,
  Button,
  Platform,
  TouchableOpacity,
  Pressable,
} from 'react-native'
import { ButtonWithChildren } from '../../components/Button'
import Text from '../../components/Text'
import { Ionicons } from '@expo/vector-icons'
import { ScrollView } from 'react-native-gesture-handler'
import DateTimePicker from '@react-native-community/datetimepicker'
import React, { useState } from 'react'

export function SocietyInfoModule(props) {
  function createEventHandler() {}

  function editSocietyHandler() {
    console.log('Pressed')
  }

  return (
    <View style={styles.moduleWrapper}>
      {/*ALL MODULE INFO CONTAINER*/}
      <View style={styles.societyContainer}>
        {/*SOCIETY PROFILEPIC + NAMES CONTAINER*/}
        <View style={styles.infoContainer}>
          {/*SOCIETY PROFILE PIC */}
          <View style={styles.imageContainer}>
            <Image
              style={styles.profilePicture}
              source={{ uri: props.societyImage }}
            />
          </View>

          {/*SOCIETY SHORTNAME + FULLNAME + BUTTON*/}
          <View style={styles.allNamesContainer}>
            <View style={styles.nameButtonContainer}>
              <Text style={styles.societyNameShort}>{props.societyName}</Text>
              <TouchableOpacity style={styles.followButtonContainer}>
                <Image
                  source={{
                    uri: 'https://cdn.discordapp.com/attachments/1059750891512664084/1061053326164238337/Pngtreebell_vector_icon_3791353.png',
                  }}
                  style={styles.followButton}
                />
              </TouchableOpacity>
            </View>

            {/*SOCIETY FULL NAME*/}
            <Text adjustsFontSizeToFit={true} style={styles.societyfullName}>
              {props.societyfullName}
            </Text>

            {/*NamesContainer Closed*/}
          </View>

          {/*Profile Picture + Names Container Closed*/}
        </View>

        {/*SOCIETY DESCRIPTION + EDITSOCIETY + CREATEEVENT CONTAINER*/}
        <View style={styles.descNfuncsContainer}>
          <Text style={styles.societyDescription}>
            {props.societyDescription}
          </Text>
          <View style={styles.buttonsContainer}>
            <Pressable onPress={editSocietyHandler}>
              <Text style={styles.functionalButton}>Edit Society</Text>
            </Pressable>
            <Pressable onPress={createEventHandler}>
              <Text style={styles.functionalButton}>Create Event</Text>
            </Pressable>
          </View>
        </View>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  moduleWrapper: {
    //borderWidth: 3,
    borderColor: 'red',
    borderRadius: 30,
    marginVertical: 10,
    backgroundColor: '#F5F5F5',
  },
  societyContainer: {
    margin: '3.5%',
  },
  infoContainer: {
    //borderWidth: 3,
    borderColor: 'blue',
    marginBottom: '5%',
    flexDirection: 'row',
  },
  imageContainer: {
    flex: 1,
    width: '100%',
    height: 'auto',
    // borderWidth: 2,
    borderColor: 'pink',
  },
  profilePicture: {
    borderRadius: 55,
    aspectRatio: 1,
    justifyContent: 'center',
  },
  allNamesContainer: {
    flex: 2,
    // borderWidth: 2,
    borderColor: 'green',
    justifyContent: 'space-between',
  },
  nameButtonContainer: {
    marginTop: '5%',
    marginLeft: '8.5%',
    flex: 1,
    //borderWidth: 2,
    flexDirection: 'row',
    justifyContent: 'space-between',
  },

  societyNameShort: {
    fontSize: 35,
    fontWeight: 'bold',
  },
  followButtonContainer: {
    //borderWidth: 2,
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
    flex: 2,
    marginLeft: '8.5%',
    fontWeight: 'bold',
  },

  descNfuncsContainer: {
    //borderWidth: 3,
    paddingTop: '2.5%',
    borderTopWidth: 1,
    borderTopEndRadius: 40,
    borderTopStartRadius: 40,
    borderColor: '#DCDCDC',
    flex: 1,
  },
  societyDescription: {
    opacity: 0.85,
    fontSize: 13,
    marginBottom: '3.5%',
  },
  buttonsContainer: {
    //borderWidth: 2,
    flexDirection: 'row',
    justifyContent: 'space-evenly',
  },
  functionalButton: {
    borderWidth: 1.5,
    borderRadius: 25,
    borderColor: '#909090',
    textAlign: 'center',
    color: '#696969',
    paddingHorizontal: '10%',
    paddingVertical: '2%',
  },
})
