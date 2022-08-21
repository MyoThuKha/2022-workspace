import Header from "./components/header";
import { Switch, Route } from "react-router-dom";
import Home from "./components/home";
import Coffee from "./components/coffee";

function App() {
  return (
    <div className="App">
      <Header></Header>
      <main>
        <Switch>
          <Route exact path="/">
            <Home></Home>
          </Route>
          <Route path="/coffee">
            <Coffee></Coffee>
          </Route>
        </Switch>
      </main>
    </div>
  );
}

export default App;
