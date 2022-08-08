import "./App.css";
import React, { Component } from "react";
import NavBar from "./components/navbar";
import Bottom from "./components/bottom";
// import Item from "./components/item";

class App extends Component {
  state = {};
  render() {
    return (
      <React.Fragment>
        <NavBar></NavBar>
        <main className="Container">
          <Bottom></Bottom>
        </main>
      </React.Fragment>
    );
  }
}

export default App;
