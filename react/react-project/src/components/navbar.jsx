import React, { Component } from "react";
import image from "../assets/main_image.jpg";
class NavBar extends Component {
  state = {};
  style = {
    height: "900px",
    backgroundImage: `url(${image})`,
    backgroundSize: "100% 900px",
  };
  render() {
    return (
      <React.Fragment>
        <div style={this.style} className="">
          <nav className="navbar sticky-top navbar-light bg-light">
            <div className="container-fluid">
              <a className="navbar-brand" href=".">
                <div className="h4">Home Page</div>
              </a>
            </div>
          </nav>

          <div className="display-3 text-white fw-bold text-center mt-5">
            Under Development
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default NavBar;
