import React, { Component } from "react";
import logo from "../logo.svg";
import bsIcon from "../assets/bootstrap.png";
class Item extends Component {
  state = {
    react: {
      image: logo,
      url: "https://reactjs.org/",
    },
    bootstrap: {
      image: bsIcon,
      url: "https://getbootstrap.com/",
    },
  };
  style = {
    height: 234,
  };
  render() {
    const current =
      this.props.items === "React" ? this.state.react : this.state.bootstrap;
    return (
      <React.Fragment>
        <a
          href={current.url}
          target="_blank"
          rel="noreferrer"
          className="text-decoration-none"
        >
          <div
            style={this.style}
            className="container bg-white rounded shadow m-2"
          >
            <div className="pt-2  justify-content-center">
              <img
                className="rounded img-fluid mx-auto d-block"
                src={current.image}
                alt="icon"
              />
            </div>
            <div className="h3 text-center text-black my-auto">
              {this.props.items}
            </div>
          </div>
        </a>
      </React.Fragment>
    );
  }
}

export default Item;
