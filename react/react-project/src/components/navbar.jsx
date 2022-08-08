import React, { Component } from "react";

class NavBar extends Component {
  state = {};
  render() {
    return (
      <nav className="navbar navbar-light">
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
