import { View, Text, StyleSheet, DatePickerAndroid } from "react-native";

const SandBox = () => {
  return (
    <View style={styles.container}>
      <View style={styles.box1}></View>
      <View style={styles.box2}></View>
      <View style={styles.box3}></View>
      <View style={styles.box4}></View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: "row",
  },
  box1: {
    flex: 1,
    width: 50,
    height: 50,
    backgroundColor: "pink",
  },
  box2: {
    flex: 1,
    width: 50,
    height: 50,
    backgroundColor: "green",
  },
  box3: {
    flex: 1,
    width: 50,
    height: 50,
    backgroundColor: "gold",
  },
  box4: {
    flex: 1,
    width: 50,
    height: 50,
    backgroundColor: "red",
  },
});

export default SandBox;
