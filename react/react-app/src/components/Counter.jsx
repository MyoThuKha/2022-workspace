import React, { Component } from "react";

class Counter extends Component {
  state = {
    value: this.props.counter.value,
  };

  render() {
    // console.log(this.props);
    let getBadgeClass = "badge m-2 bg-";
    getBadgeClass += this.state.value === 0 ? "warning" : "primary";
    return (
      <div>
        {this.props.children}
        <span className={getBadgeClass}>{this.formatCount()}</span>
        <button
          onClick={() => this.handleIncrement({ id: 1 })}
          className="btn btn-secondary m-2"
        >
          Increment
        </button>
        <button
          onClick={() => this.props.onDelete(this.props.counter.id)}
          className="btn btn-warning m-2"
        >
          Delete
        </button>
      </div>
    );
  }

  handleIncrement = (product) => {
    // console.log(product);
    this.setState({ value: this.state.value + 1 });
  };

  formatCount() {
    const { value: count } = this.state;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
