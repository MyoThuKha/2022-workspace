import React, { useState } from "react";
import {
  Button,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";

const AddItem = ({ onSubmitHandler }) => {
  const [text, setText] = useState("");
  return (
    <React.Fragment>
      <View style={styles.inputBox}>
        <TextInput
          multiline
          placeholder="Add a list"
          onChangeText={(val) => {
            setText(val);
          }}
        />
      </View>
      <View style={styles.buttonSection}>
        <TouchableOpacity
          onPress={() => {
            onSubmitHandler(text);
          }}
        >
          <View style={styles.submitButton}>
            <Text style={styles.buttonText}>Add</Text>
          </View>
        </TouchableOpacity>
      </View>
    </React.Fragment>
  );
};

const styles = StyleSheet.create({
  inputBox: {
    borderColor: "black",
    borderWidth: 1,
    borderRadius: 15,
    height: 60,
    marginHorizontal: 20,
    marginVertical: 30,
    padding: 20,
  },
  buttonSection: {
    flex: 1,
    alignItems: "center",
  },
  submitButton: {
    backgroundColor: "pink",
    width: 150,
    height: 60,
    borderRadius: 25,
    justifyContent: "center",
    alignItems: "center",
  },
  buttonText: {
    color: "white",
    fontSize: 20,
  },
});

export default AddItem;
