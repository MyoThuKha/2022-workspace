import { StyleSheet, View, Text } from "react-native";

const Header = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>To Do</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 30,
    paddingVertical: 10,
    borderBottomWidth: 0.5,
    borderBottomColor: "grey",
  },
  title: {
    fontSize: 30,
  },
});
export default Header;
