import React, { Component } from "react";

class Counter extends Component {
  render() {
    // console.log(this.props);
    let getBadgeClass = "badge m-2 bg-";
    getBadgeClass += this.props.counter.value === 0 ? "warning" : "primary";
    return (
      <div>
        {/* {this.props.children} */}
        <span className={getBadgeClass}>{this.formatCount()}</span>
        <button
          onClick={() => this.props.onIncrease(this.props.counter)}
          className="btn btn-secondary m-2"
        >
          Increment
        </button>
        <button
          onClick={() => this.props.onDelete(this.props.counter.id)}
          className="btn btn-danger m-2"
        >
          Delete
        </button>
      </div>
    );
  }

  formatCount() {
    const { value: count } = this.props.counter;
    return count === 0 ? "Zero" : count;
  }
}

export default Counter;
