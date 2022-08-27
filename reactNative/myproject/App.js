import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import {
  StyleSheet,
  Text,
  View,
  Button,
  TextInput,
  ScrollView,
} from "react-native";

export default function App() {
  const [items, setItems] = useState([
    { name: "John", key: 1 },
    { name: "Sam", key: 2 },
    { name: "Anon", key: 3 },
    { name: "Olivia", key: 4 },
    { name: "James", key: 5 },
    { name: "May", key: 6 },
  ]);
  return (
    <View style={styles.container}>
      <ScrollView>
        {items.map((item) => {
          return (
            <View key={item.key}>
              <Text style={styles.item}>{item.name}</Text>
            </View>
          );
        })}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    // alignItems: "center",
    // justifyContent: "center",
  },
  item: {
    color: "white",
    backgroundColor: "#c68642",
    height: 100,
    borderRadius: 8,
    margin: 30,
    padding: 30,
  },
});
