import { View, Text, StyleSheet } from "react-native";

const TodoItem = ({ text }) => {
  return (
    <View style={styles.container}>
      <Text style={styles.text}>{text}</Text>
    </View>
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
