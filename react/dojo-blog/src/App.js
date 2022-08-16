import "./App.css";
import React from "react";
import NavBar from "./components/Navbar";
import Home from "./components/Home";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Create from "./components/Create";
function App() {
  return (
    <React.Fragment>
      <Router>
        <NavBar></NavBar>
        <main className="m-5">
          <Switch>
            <Route exact path="/">
              <Home />
            </Route>
            <Route path="/create">
              <Create />
            </Route>
          </Switch>
        </main>
      </Router>
    </React.Fragment>
  );
}

export default App;
