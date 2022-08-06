import React, { Component } from "react";

class Counter extends Component {
  state = {
    value: this.props.value,
  };

  render() {
    console.log(this.props);
    let getBadgeClass = "badge m-2 bg-";
    getBadgeClass += this.state.value === 0 ? "warning" : "primary";
    return (
      <div>
        <span className={getBadgeClass}>{this.formatCount()}</span>
        <button
          onClick={() => this.handleIncrement({ id: 1 })}
          className="btn btn-secondary m-2"
        >
          Increment
        </button>
      </div>
    );
  }

  handleIncrement = (product) => {
    console.log(product);
    this.setState({ value: this.state.value + 1 });
  };
  formatCount() {
    const { value: count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
