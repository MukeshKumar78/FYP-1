import { ReactNode, useState } from "react";
import { View, Text, Modal, TouchableOpacity, StyleSheet } from "react-native";
import Ionicons from "@expo/vector-icons/Ionicons";

export function OptionsModalButton({ children }: {
  children: ReactNode[] | ReactNode 
}) {
  const [visible, setVisible] = useState(false);

  return (
    <View style={styles.container}>
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
            {children}
          </View>
        </TouchableOpacity>
      </Modal>
    </View>
  );
};

export function Option({ text, onPress }: {
  text: string,
  onPress: () => void
}) {
  return <TouchableOpacity onPress={onPress} >
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
