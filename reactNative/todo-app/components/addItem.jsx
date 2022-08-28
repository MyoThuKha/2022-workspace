import { useState } from "react";
import { Button, StyleSheet, Text, TextInput, View } from "react-native";

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
      <View style={styles.submitButton}>
        <Button
          title="Add"
          color="grey"
          onPress={() => {
            onSubmitHandler(text);
          }}
        />
      </View>
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
    marginTop: 20,
    marginBottom: 60,
    marginHorizontal: 80,
  },
});

export default AddItem;
