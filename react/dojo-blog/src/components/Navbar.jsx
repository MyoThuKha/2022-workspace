import React from "react";

const NavBar = () => {
  return (
    <React.Fragment>
      <nav className="navbar navbar-light bg-light">
        <div className="container">
          <span className="navbar-brand mb-0 text-danger h1">
            The Dojo Blog
          </span>
          <div className="justify-content-end">
            <a href="#home" className="d-inline-block nav-link me-5">
              Home
            </a>
            <a href="#home" className="d-inline-block nav-link">
              New Blog
            </a>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
};

export default NavBar;
