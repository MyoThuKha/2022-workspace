import React from "react";
import { Link } from "react-router-dom";

const NavBar = () => {
  return (
    <React.Fragment>
      <nav className="navbar navbar-light bg-light">
        <div className="container">
          <span className="navbar-brand mb-0 text-danger h1">
            The Dojo Blog
          </span>
          <div className="justify-content-end">
            <Link
              to="/"
              className="d-inline-block text-secondary nav-link me-5"
            >
              Home
            </Link>
            <Link
              to="/create"
              className="d-inline-block text-secondary nav-link"
            >
              New Blog
            </Link>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
};

export default NavBar;
