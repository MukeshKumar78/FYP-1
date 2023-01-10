import {  launchImageLibrary, Asset } from 'react-native-image-picker';
import { View, TouchableOpacity, Text, StyleSheet, Image } from 'react-native';
import { useState } from 'react';


export type EventImage = Asset;

/*
* Handles opening gallery on mobile
* Displays selected images and video thumbnails
* Calls @param onPick with the images/videos when selected
*/
export default function ImagePicker({ onPick }: {
  onPick: (assets: EventImage[]) => void
}) {
  const [images, setImages] = useState<Asset[]>([]);
  console.log(images);

  // Saves list of images/videos to state and sends using callback
  async function handleSelectImages() {
    console.log('hello')
    const result = await launchImageLibrary({
      mediaType: 'mixed',
      selectionLimit: 5,
    });

    if (result.errorCode) {
      console.error(result.errorMessage)
    } else if (result.assets) {
      setImages(result.assets);
      onPick(result.assets);
    }
  }

  // Display selected images and a selection button
  // TODO: increase upload limit while keeping display limit to 5. Add a "+x more" element to show there are more 
  return <View style={styles.touchableWrapper}>
    {images.map(image =>
      <Image
        style={styles.touchable}
        source={{
          uri: image.uri
        }}
      />
    )}
    <TouchableOpacity
      style={styles.touchable}
      onPress={handleSelectImages}
    >
      <Text style={{ color: '#414143', fontSize: 16 }}> Select </Text>
      <Text style={{ color: '#414143', fontSize: 16 }}> Images </Text>
    </TouchableOpacity>
  </View>
}

const styles = StyleSheet.create({
  touchableWrapper: {
    flexDirection: 'row',
    flexWrap: 'wrap'
  },
  image: {
    width: 90,
    height: 90,
    aspectRatio: 1
  },
  touchable: {
    width: 90,
    height: 90,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#d5d5d6',
    borderColor: 'gray',
    borderWidth: 0.3,
    padding: 7,
    margin: 3,
    elevate: 5
  }
})
