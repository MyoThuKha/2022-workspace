import React, { Component } from "react";

class Counter extends Component {
  state = {
    count: 0,
    imgUrl: "https://picsum.photos/200",
  };
  render() {
    return (
      <React.Fragment>
        <img src={this.state.imgUrl} alt="" />
        <span>{this.formatCount()}</span>
        <button>Increment</button>
      </React.Fragment>
    );
  }

  formatCount() {
    const { count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
