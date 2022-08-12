//useState
import { useState } from "react";
import React from "react";

const Home = () => {
  //destructuring
  const [name, newName] = useState("Mg Mg");
  const [age, newAge] = useState(18);

  //update
  const updateVar = () => {
    newName("Aye Aye");
    newAge(23);
  };
  return (
    <React.Fragment>
      <div className="container h4 mb-5">HomePage</div>
      <button onClick={updateVar} className="btn btn-primary">
        Click me
      </button>
      <div className="lead">
        {name} is {age} years old.
      </div>
    </React.Fragment>
  );
};

export default Home;
