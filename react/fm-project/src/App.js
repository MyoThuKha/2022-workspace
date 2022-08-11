import "./App.css";
import React from "react";
import NavBar from "./components/navbar";
import About from "./components/about";
import Projects from "./components/project";

function App() {
  return (
    <React.Fragment>
      <div
        // style={{ height: "1000px" }}
        className="bg-black"
        id="home"
      >
        <NavBar />
        <div className="container-fluid align-items-between">
          <About />
          <div style={{ marginTop: 200 }}></div>
          <Projects />
        </div>
      </div>
    </React.Fragment>
  );
}

export default App;
