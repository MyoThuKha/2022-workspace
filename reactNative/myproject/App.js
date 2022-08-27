import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import {
  StyleSheet,
  Text,
  View,
  Button,
  TextInput,
  ScrollView,
  FlatList,
  TouchableOpacity,
} from "react-native";

export default function App() {
  const [items, setItems] = useState([
    { name: "John", id: 1 },
    { name: "Sam", id: 2 },
    { name: "Anon", id: 3 },
    { name: "Olivia", id: 4 },
    { name: "James", id: 5 },
    { name: "May", id: 6 },
  ]);

  const onTouchHandler = (id) => {
    setItems((origin) => {
      return origin.filter((item) => item.id != id);
    });
  };
  return (
    <View style={styles.container}>
      <FlatList
        data={items}
        keyExtractor={(item) => item.id}
        numColumns={2}
        horizontal={false}
        renderItem={({ item }) => (
          <TouchableOpacity onPress={() => onTouchHandler(item.id)}>
            <Text style={styles.item}>{item.name}</Text>
          </TouchableOpacity>
        )}
        //destructuring props
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    // justifyContent: "center",
  },
  item: {
    color: "white",
    backgroundColor: "#c68642",
    height: 100,
    width: 150,
    borderRadius: 8,
    margin: 30,
    padding: 30,
  },
});
