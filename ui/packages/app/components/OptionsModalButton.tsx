import React, { ReactNode, useState } from "react";
import { View, Text, Modal, TouchableOpacity, StyleSheet, ViewStyle, StyleProp, TouchableWithoutFeedback } from "react-native";
import Ionicons from "@expo/vector-icons/Ionicons";
import { Link } from "solito/link";

const ModalContext = React.createContext(() => { });

export function OptionsModalButton({ children, style }: {
  children: ReactNode[] | ReactNode
  style?: StyleProp<ViewStyle>
}) {
  const [visible, setVisible] = useState(false);

  // If no options provided, render nothing
  if (!children || Array.isArray(children) && children.filter(Boolean).length == 0)
    return <></>

  return (
    <View style={[styles.container, style]}>
      <TouchableOpacity
        onPress={() => setVisible(true)}
        activeOpacity={1}
        style={styles.button}>
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

export function Option({ text, onPress, href, closeOnTouch = true }: {
  text: string,
  closeOnTouch?: boolean,
  onPress?: () => void,
  href?: string
}) {
  const close = React.useContext(ModalContext);

  const button = <Text style={styles.option}>{text}</Text>

  if (href)
    return <Link href={href}>{button}</Link>

  if (onPress)
    return <TouchableOpacity onPress={() => {
      if (closeOnTouch) close();
      onPress();
    }} >{button}</TouchableOpacity>


  return button
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
