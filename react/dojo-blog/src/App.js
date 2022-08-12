import "./App.css";
import React from "react";
import NavBar from "./components/Navbar";
import Home from "./components/Home";

function App() {
  return (
    <React.Fragment>
      <NavBar></NavBar>
      <main className="m-5">
        <Home></Home>
      </main>
    </React.Fragment>
  );
}

export default App;
