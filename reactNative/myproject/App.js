import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { StyleSheet, Text, View, Button, TextInput } from "react-native";

export default function App() {
  const [name, setName] = useState("John");
  const [age, setAge] = useState("18");
  const clickHandler = () => {
    setName("My name is Myo Thu Kha.");
  };
  return (
    <View style={styles.container}>
      <Text style={styles.header}>{name}</Text>
      <View>
        <TextInput
          placeholder="Name"
          onChangeText={(val) => setName(val)}
          style={styles.input}
        />
      </View>
      <View>
        <Text style={styles.header}>{age}</Text>
        <View>
          <TextInput
            placeholder="Age"
            keyboardType="email"
            onChangeText={(val) => setAge(val)}
            style={styles.input}
          />
        </View>
      </View>

      {/* // */}
      <View style={styles.button}>
        <Button title="Change" onPress={clickHandler} />
      </View>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  header: {
    fontSize: 30,
    margin: 30,
  },
  button: {
    marginTop: 10,
  },
  input: {
    borderColor: "grey",
    borderWidth: 1,
    borderRadius: 8,
    padding: 10,
    width: 350,
    height: 50,
  },
});
