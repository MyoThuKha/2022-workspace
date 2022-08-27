import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { StyleSheet, Text, View, Button } from "react-native";

export default function App() {
  const [name, setName] = useState("Welcome");
  const clickHandler = () => {
    setName("My name is Myo Thu Kha.");
  };
  return (
    <View style={styles.container}>
      <Text>{name}</Text>
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
    fontWeight: "bold",
  },
  button: {
    marginTop: 10,
  },
});
