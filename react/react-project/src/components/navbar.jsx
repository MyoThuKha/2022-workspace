import React, { Component } from "react";

class NavBar extends Component {
  state = {};
  render() {
    return (
      <nav className="navbar navbar-dark bg-dark">
        <div className="container-fluid">
          <a className="navbar-brand" href=".">
            <div className="lead">Home Page</div>
          </a>
        </div>
      </nav>
    );
  }
}

export default NavBar;
