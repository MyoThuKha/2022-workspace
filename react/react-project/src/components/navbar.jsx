import React, { Component } from "react";
import image from "../assets/main_image.jpg";
class NavBar extends Component {
  state = {};
  style = {
    height: "800px",
    backgroundImage: `url(${image})`,
    backgroundSize: "100% 800px",
  };
  render() {
    return (
      <React.Fragment>
        <div style={this.style} className="">
          <nav className="navbar navbar-light bg-light">
            <div className="container-fluid">
              <a className="navbar-brand" href=".">
                <div className="lead">Home Page</div>
              </a>
            </div>
          </nav>
        </div>
      </React.Fragment>
    );
  }
}

export default NavBar;
