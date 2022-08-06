import React, { Component } from "react";

class NavBar extends Component {
  state = {};
  render() {
    return (
      <nav className="navbar bg-light">
        <div className="container-fluid">
          <a className="navbar-brand" href=".">
            Navbar
          </a>
        </div>
      </nav>
    );
  }
}

export default NavBar;
