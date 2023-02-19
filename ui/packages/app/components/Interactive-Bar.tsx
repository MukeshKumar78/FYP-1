import { View, StyleSheet } from 'react-native'
import { ButtonWithChildren } from './Button'
import { Ionicons } from '@expo/vector-icons'

export function InteractiveBar(props) {
  function ratingHandler() {}

  function commentsHandler() {}

  function shareHandler() {}

  return (
    <View style={styles.interactiveBarContainer}>
      <ButtonWithChildren
        style={styles.buttons}
        onPress={() => {
          ratingHandler
        }}
      >
        <Ionicons name="star" {...interactiveButtonProps} />
      </ButtonWithChildren>

      <ButtonWithChildren style={styles.buttons} onPress={() => {}}>
        <Ionicons name="chatbox" {...interactiveButtonProps} />
      </ButtonWithChildren>

      <ButtonWithChildren
        style={styles.buttons}
        onPress={() => {
          shareHandler
        }}
      >
        <Ionicons name="share" {...interactiveButtonProps} />
      </ButtonWithChildren>
    </View>
  )
}

const interactiveButtonProps = {
  size: 20,
  color: 'gray',
}

const styles = StyleSheet.create({
  interactiveBarContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    flex: 1,
  },

  buttons: {
    backgroundColor: '#EFEFEF',
  },
})
