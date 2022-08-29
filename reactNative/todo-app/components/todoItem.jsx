import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { MaterialCommunityIcons } from "@expo/vector-icons";

const TodoItem = ({ item, onDeleteHandler }) => {
  return (
    <TouchableOpacity onPress={() => onDeleteHandler(item.key)}>
      <View key={item.key} style={styles.container}>
        <View style={styles.textView}>
          <Text style={styles.text}>{item.text}</Text>
        </View>
        <View style={styles.iconView}>
          <MaterialCommunityIcons
            name="delete-variant"
            size={25}
            color="#333"
          />
        </View>
      </View>
    </TouchableOpacity>
  );
};

const styles = StyleSheet.create({
  container: {
    marginHorizontal: 30,
    height: 80,
    marginVertical: 20,
    padding: 10,
    borderColor: "grey",
    borderWidth: 1,
    borderRadius: 9,
    borderStyle: "dashed",
    flexDirection: "row",
    justifyContent: "space-between",
  },
  textView: {
    justifyContent: "center",
  },
  text: {
    fontSize: 20,
  },
  iconView: {
    justifyContent: "center",
  },
});

export default TodoItem;
