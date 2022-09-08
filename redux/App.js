import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import MainNavigation from "./routes/stack";
import { LogBox } from "react-native";
import store from "./reducers/store";
import { Provider } from "react-redux";

LogBox.ignoreLogs([
  "Non-serializable values were found in the navigation state",
]);

export default function App() {
  return (
    <Provider store={store}>
      <MainNavigation></MainNavigation>
    </Provider>
  );
}
