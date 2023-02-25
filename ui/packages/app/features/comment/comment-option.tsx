import React, { useState } from "react";
import { View, Text, Modal, TouchableOpacity, StyleSheet } from "react-native";
import Ionicons from "@expo/vector-icons/Ionicons";

const DropdownModal = (props) => {
  const { options, onSelectOption } = props;
  const [visible, setVisible] = useState(false);

  const handleSelectOption = (option) => {
    onSelectOption(option);
    setVisible(false);
  };

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
            {options.map((option, index) => (
              <TouchableOpacity
                key={index}
                onPress={() => handleSelectOption(option)}
              >
                <Text style={styles.option}>{option}</Text>
              </TouchableOpacity>
            ))}
          </View>
        </TouchableOpacity>
      </Modal>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    alignItems: "center",
    //marginVertical: 20,
  },
  button: {
    //backgroundColor: "gray",
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
    //borderBottomWidth: 3,
  },
  box: {
    //borderWidth: 1,
    height: "100%",
    width: "100%",
    alignItems: "center",
  },
});

export default DropdownModal;
