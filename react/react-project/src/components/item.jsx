import React, { Component } from "react";
import logo from "../logo.svg";
class Item extends Component {
  state = {
    react: {
      image: logo,
      url: "https://reactjs.org/",
    },
    bootstrap: {
      image:
        "https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo-shadow.png",
      url: "https://getbootstrap.com/",
    },
  };
  style = {
    height: 234,
  };
  render() {
    const current =
      this.props.items === "React" ? this.state.react : this.state.bootstrap;
    const imageResize = this.props.items === "React" ? "" : "mt-1 mb-2 mx-4";
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
              <div className={imageResize}>
                <img
                  className="rounded img-fluid mx-auto d-block"
                  src={current.image}
                  alt="icon"
                />
              </div>
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
