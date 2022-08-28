import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { FlatList, StyleSheet, Text, View } from "react-native";
import AddItem from "./components/addItem";
import Header from "./components/header";
import TodoItem from "./components/todoItem";

export default function App() {
  const [todoList, setTodoList] = useState([
    { text: "buy milk", key: "1" },
    { text: "do landuary", key: "2" },
    { text: "go to walmart", key: "3" },
  ]);

  const onDeleteHandler = (id) => {
    setTodoList((preList) => {
      return preList.filter((item) => item.key != id);
    });
  };
  const onSubmitHandler = (text) => {
    setTodoList([{ text: text, key: Math.random().toString() }, ...todoList]);
  };
  return (
    <View style={styles.container}>
      <Header />
      <AddItem onSubmitHandler={onSubmitHandler} />
      <FlatList
        data={todoList}
        renderItem={({ item }) => (
          <View key={item.key}>
            <TodoItem item={item} onDeleteHandler={onDeleteHandler} />
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
