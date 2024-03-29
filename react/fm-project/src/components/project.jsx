import React from "react";

const Projects = () => {
  return (
    <React.Fragment>
      <div
        id="projects"
        style={{
          padingTop: 240,
          // marginBottom: 20,
        }}
      ></div>
      <div style={{ height: "100vh" }} className="container-fluid">
        <div className="text-white h3">
          {template(
            "https://github.com/MyoThuKha/Simple-Note-App",
            "Simple Note App",
            "Note taking app created with flutter"
          )}
          {template(
            "https://github.com/MyoThuKha/Coffee-App",
            "Coffee App",
            "Coffee app with firebase flutter"
          )}
        </div>
      </div>
    </React.Fragment>
  );
};

export default Projects;

function template(link, header, text) {
  return (
    <React.Fragment>
      <a
        href={link}
        className="text-white text-decoration-none"
        target="_blank"
        rel="noreferrer"
      >
        {header}
      </a>
      <div className="text-white lead mt-4 mb-5">{text}</div>
    </React.Fragment>
  );
}
