import React, { ReactNode, useState } from "react";
import { View, Text, Modal, TouchableOpacity, StyleSheet, ViewStyle, StyleProp } from "react-native";
import Ionicons from "@expo/vector-icons/Ionicons";

const ModalContext = React.createContext(() => { });

export function OptionsModalButton({ children, style }: {
  children: ReactNode[] | ReactNode
  style?: StyleProp<ViewStyle>
}) {
  const [visible, setVisible] = useState(false);

  return (
    <View style={[styles.container, style]}>
      <TouchableOpacity onPress={() => setVisible(true)} style={styles.button}>
        <View style={styles.box}>
          <Ionicons name="ellipsis-vertical" size={18} />
        </View>
      </TouchableOpacity>
      <Modal visible={visible} transparent>
        <TouchableOpacity
          onPress={() => setVisible(false)}
          style={styles.modal}
        >
          <View style={styles.dropdown}>
            <ModalContext.Provider value={() => setVisible(false)}>
              {children}
            </ModalContext.Provider>
          </View>
        </TouchableOpacity>
      </Modal>
    </View>
  );
};

export function Option({ text, onPress, closeOnTouch = true }: {
  text: string,
  closeOnTouch?: boolean,
  onPress: () => void
}) {
  const close = React.useContext(ModalContext);

  return <TouchableOpacity onPress={() => {
    if (closeOnTouch) close();
    onPress();
  }} >
    <Text style={styles.option}>{text}</Text>
  </TouchableOpacity>
}

const styles = StyleSheet.create({
  container: {
    alignItems: "center",
  },
  button: {
    height: 25,
    width: 25,
    borderRadius: 5,
  },
  text: {
    color: "white",
    fontSize: 16,
  },
  modal: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "rgba(0, 0, 0, 0.5)",
  },
  dropdown: {
    backgroundColor: "white",
    padding: 10,
    borderRadius: 5,
    width: 200,
  },
  option: {
    marginVertical: 10,
    fontSize: 16,
    alignSelf: "center",
  },
  box: {
    height: "100%",
    width: "100%",
    alignItems: "center",
  },
});
