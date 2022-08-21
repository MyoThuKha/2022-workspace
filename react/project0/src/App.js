import Header from "./components/header";
import { Switch, Route } from "react-router-dom";
import Home from "./components/home";

function App() {
  return (
    <div className="App">
      <Header></Header>
      <main>
        <Switch>
          <Route exact path="/">
            <Home></Home>
          </Route>
        </Switch>
      </main>
    </div>
  );
}

export default App;
