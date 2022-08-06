import React, { Component } from "react";
import Counter from "./counter";

class Counters extends Component {
  render() {
    return (
      <div>
        <button
          onClick={this.props.onReset}
          className="btn btn-lg btn-primary m-2"
        >
          Reset
        </button>
        {this.props.counters.map((each) => (
          <Counter
            key={each.id}
            onDelete={this.props.onDelete}
            onIncrease={this.props.onIncrease}
            counter={each}
            // value={each.value}
            // id={each.id}
          >
            {/* can be pass id={each.id} as data and adding h4 in counter  */}
            <h4>Title {each.id}</h4>
          </Counter>
        ))}
      </div>
    );
  }
}

export default Counters;
