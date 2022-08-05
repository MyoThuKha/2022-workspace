//update state
import React, { Component } from "react";

class Counter extends Component {
  state = {
    count: 0,
    tags: [],
  };

  render() {
    let getBadgeClass = "badge m-2 bg-";
    getBadgeClass += this.state.count === 0 ? "warning" : "primary";
    return (
      <div>
        <span className={getBadgeClass}>{this.formatCount()}</span>
        <button
          onClick={this.handleIncrement}
          className="btn btn-secondary m-2"
        >
          Increment
        </button>
      </div>
    );
  }

  handleIncrement = () => {
    this.setState({ count: this.state.count + 1 });
  };
  formatCount() {
    const { count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
