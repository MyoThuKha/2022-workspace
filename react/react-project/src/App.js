import "./App.css";
import React, { Component } from "react";
import NavBar from "./components/navbar";
import Item from "./components/item";

class App extends Component {
  state = {};
  render() {
    return (
      <React.Fragment>
        <NavBar></NavBar>
        <main className="Container">
          <Item></Item>
        </main>
      </React.Fragment>
    );
  }
}

export default App;
