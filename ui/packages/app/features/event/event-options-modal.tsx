import { useState } from 'react'
import { View as DView } from 'dripsy'
import {
  View,
  Text,
  Modal,
  StyleProp,
  TextStyle,
  ViewStyle,
  TouchableOpacity,
  TouchableWithoutFeedback,
} from 'react-native'
import { Entypo } from '@expo/vector-icons'
import Button from '../../components/Button'

export default function EventOptionsModal(props: {
  style: StyleProp<ViewStyle>
}) {
  const [isVisible, setIsVisible] = useState(false)

  // EVENT OPTIONS BUTTON  HANDLER WHICH IS IN EVENT TITLE BAR
  return (
    <DView {...props}>
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
            <DView variant="layout.card" sx={{ width: '80%', maxWidth: 600 }}>
              <Button
                style={{ flex: undefined, margin: 3 }}
                onPress={() => setIsVisible(false)}
                title="Register"
              />
              <Button
                style={{ flex: undefined, margin: 3 }}
                onPress={() => setIsVisible(false)}
                title="Mute"
              />
            </DView>
          </TouchableWithoutFeedback>
        </TouchableOpacity>
      </Modal>
    </DView>
  )
}
