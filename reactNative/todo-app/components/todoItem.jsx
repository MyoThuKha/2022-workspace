import { View, Text, StyleSheet, TouchableOpacity } from "react-native";

const TodoItem = ({ item, onDeleteHandler }) => {
  return (
    <TouchableOpacity onPress={() => onDeleteHandler(item.key)}>
      <View style={styles.container}>
        <Text style={styles.text}>{item.text}</Text>
      </View>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  container: {
    marginHorizontal: 30,
    height: 80,
    marginVertical: 20,
    paddingHorizontal: 10,
    borderColor: "grey",
    borderWidth: 1,
    borderRadius: 9,
    borderStyle: "dashed",
  },
  text: {
    paddingTop: 20,
    fontSize: 20,
  },
});

export default TodoItem;
