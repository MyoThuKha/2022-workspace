import "./App.css";
import React from "react";
import NavBar from "./components/Navbar";
import Home from "./components/Home";
import { BrowseRouter as Router, Route, Switch } from "react-router-dom";
function App() {
  return (
    <React.Fragment>
      <NavBar></NavBar>
      <main className="m-5">
        <Router>
          <Switch>
            <Route path="/">
              <Home />
            </Route>
          </Switch>
        </Router>
      </main>
    </React.Fragment>
  );
}

export default App;
