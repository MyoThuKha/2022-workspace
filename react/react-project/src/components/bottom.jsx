import React, { Component } from "react";
import Item from "./item";
class Bottom extends Component {
  state = {
    items: ["React", "Bootstrap"],
  };
  render() {
    return (
      <React.Fragment>
        <div className="display-4 text-center mb-4">
          This project is build with
        </div>
        <div className="container">
          <div className="row justify-content-center">
            {this.state.items.map((item) => (
              <div className="col-3">
                <Item items={item}></Item>
              </div>
            ))}
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Bottom;
