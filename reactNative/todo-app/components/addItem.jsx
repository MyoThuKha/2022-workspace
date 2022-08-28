import { useState } from "react";
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
    <View>
      <View style={styles.inputBox}>
        <TextInput
          multiline
          placeholder="Add a list"
          onChangeText={(val) => {
            setText(val);
          }}
        />
      </View>
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
  submitButton: {
    marginVertical: 40,
    marginHorizontal: 80,
    marginLeft: 120,
    backgroundColor: "grey",
    width: 150,
    height: 60,
    borderRadius: 25,
    justifyContent: "center",
  },
  buttonText: {
    color: "white",
    textAlign: "center",
    fontSize: 20,
  },
});

export default AddItem;
