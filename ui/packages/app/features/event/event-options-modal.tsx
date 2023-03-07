import { Option, OptionsModalButton } from 'app/components/OptionsModalButton'
import { View, StyleSheet } from 'react-native'

export default function EventOptionsModal() {

  return <View style={styles.modalButton}>
    <OptionsModalButton>
      <Option text="hello" onPress={() => { }} />
    </OptionsModalButton>
  </View>
}


const styles = StyleSheet.create({
  modalButton: {
    right: 0,
    position: 'absolute'
  }
});
