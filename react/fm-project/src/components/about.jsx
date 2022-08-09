import React from "react";

const About = () => {
  return (
    <React.Fragment>
      <div className="container-fluid" id="about">
        <div
          style={{ paddingTop: 140, marginBottom: 20 }}
          className="display-2 text-white"
        >
          <span className="d-block d-md-inline">Hello, </span>
          <span>I am Myo Thu Kha.</span>
        </div>
        <div className="lead text-white">
          I am a junior developer who loves to code.
        </div>
      </div>
    </React.Fragment>
  );
};

export default About;
