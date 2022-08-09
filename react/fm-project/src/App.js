import "./App.css";
import React from "react";
import NavBar from "./components/navbar";
import About from "./components/about";

function App() {
  return (
    <React.Fragment>
      <div style={{ height: "1000px" }} className="bg-black">
        <NavBar />
        <About />
      </div>
    </React.Fragment>
  );
}

export default App;
