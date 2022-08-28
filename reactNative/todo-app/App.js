import { StatusBar } from "expo-status-bar";
import { FlatList, StyleSheet, Text, View } from "react-native";
import Header from "./components/header";
import TodoItem from "./components/todoItem";

export default function App() {
  const todoList = [
    { text: "buy milk", key: "1" },
    { text: "do landuary", key: "2" },
    { text: "go to walmart", key: "3" },
  ];
  return (
    <View style={styles.container}>
      <Header />
      <FlatList
        data={todoList}
        renderItem={({ item }) => (
          <View key={item.key}>
            <TodoItem text={item.text} />
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    // flex: 1,
    backgroundColor: "#fff",
  },
});
