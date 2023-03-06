import { useState } from 'react'
import {
  View,
  Modal,
  StyleProp,
  ViewStyle,
  TouchableOpacity,
  TouchableWithoutFeedback,
} from 'react-native'
import { Entypo } from '@expo/vector-icons'
import { Button } from '../../components/Button'

export default function EventOptionsModal(props: {
  style: StyleProp<ViewStyle>
}) {
  const [isVisible, setIsVisible] = useState(false)

  // EVENT OPTIONS BUTTON  HANDLER WHICH IS IN EVENT TITLE BAR
  return (
    <View {...props}>
      <Entypo
        onPress={() => setIsVisible(true)}
        size={20}
        name="dots-three-vertical"
      />
      <Modal
        animationType="fade"
        onRequestClose={() => setIsVisible(false)}
        transparent
        visible={isVisible}
      >
        <TouchableOpacity
          style={{
            flex: 1,
            justifyContent: 'center',
            alignItems: 'center',

            backgroundColor: 'rgba(0,0,0,0.5)',
          }}
          onPressOut={() => setIsVisible(false)}
        >
          <TouchableWithoutFeedback>
            <View style={{ width: '80%', maxWidth: 600 }}>
              <Button
                onPress={() => setIsVisible(false)}
                text="Register"
              />
              <Button
                onPress={() => setIsVisible(false)}
                text="Mute"
              />
            </View>
          </TouchableWithoutFeedback>
        </TouchableOpacity>
      </Modal>
    </View>
  )
}
