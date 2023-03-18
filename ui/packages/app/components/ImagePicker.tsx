import { launchImageLibrary, Asset } from 'react-native-image-picker';
import { TouchableOpacity, StyleSheet, Image, Platform } from 'react-native';
import { View, Text } from './'
import { useState } from 'react';

export type ImagePickerAsset = {
  name: string
  type: string
  uri: string
};

/*
* Handles opening gallery on mobile
* Displays selected images and video thumbnails
* Calls @param onPick with the images/videos when selected
*/
export default function ImagePicker({ onPick }: {
  onPick: (assets: (File | ImagePickerAsset)[]) => void
}) {
  const [images, setImages] = useState<Asset[]>([]);

  // Saves list of images/videos to state and sends using callback
  async function handleSelectImages() {
    const result = await launchImageLibrary({
      mediaType: 'photo',
      selectionLimit: 5,
    });

    if (result.errorCode) {
      console.error(result.errorMessage)
    } else if (result.assets) {

      setImages(result.assets);
      onPick(result.assets.map(a => {
        // fix missing data for web
        if (!a.type) a.type = "image/jpeg"
        if (!a.fileName) a.fileName = (Math.random() + 1).toString(36).substring(7)
        return { name: a.fileName, type: a.type, uri: a.uri as string }
      }));
    }
  }

  // Display selected images and a selection button
  // TODO: increase upload limit while keeping display limit to 5. Add a "+x more" element to show there are more 
  return <View style={styles.touchableWrapper}>
    {images.map((image, key) =>
      <Image
        key={key}
        style={styles.touchable}
        source={{
          uri: image.uri
        }}
      />
    )}
    {Platform.select({
      native:
        <TouchableOpacity
          style={styles.touchable}
          onPress={handleSelectImages}
        >
          <Text style={{ color: '#414143', fontSize: 16 }}> Select </Text>
          <Text style={{ color: '#414143', fontSize: 16 }}> Images </Text>
        </TouchableOpacity>,
      web:
        <input
          type="file"
          accept="image/png, image/jpeg"
          onChange={(e) => {
            const fileList = e.target.files;
            const assets: File[] = []
            if (fileList) {
              for (let i = 0; i < fileList.length; i++) {
                const item = fileList.item(i);
                if (item)
                  assets.push(item)
              }
            }
            setImages(assets);
            if (fileList)
              onPick(assets);
          }}
        />
    })}
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
