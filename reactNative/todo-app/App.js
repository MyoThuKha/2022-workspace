import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import {
  Alert,
  FlatList,
  Keyboard,
  StyleSheet,
  TouchableWithoutFeedback,
  View,
} from "react-native";
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
    if (text.length > 0) {
      setTodoList([{ text: text, key: Math.random().toString() }, ...todoList]);
    } else {
      Alert.alert("Input", "Add Something", [{ text: "Ok" }]);
    }
  };
  return (
    <TouchableWithoutFeedback
      onPress={() => {
        Keyboard.dismiss();
      }}
    >
      {/* // */}
      <View style={styles.container}>
        <Header />
        <View style={styles.inputSection}>
          <AddItem onSubmitHandler={onSubmitHandler} />
        </View>
        <View style={styles.list}>
          <FlatList
            data={todoList}
            renderItem={({ item }) => (
              <TodoItem item={item} onDeleteHandler={onDeleteHandler} />
            )}
          />
        </View>
      </View>

      {/* // */}
    </TouchableWithoutFeedback>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
  inputSection: {
    flex: 1,
  },
  list: {
    flex: 2,
  },
});
