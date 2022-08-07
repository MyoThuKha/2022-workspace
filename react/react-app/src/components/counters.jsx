import React, { Component } from "react";
import Counter from "./counter";

class Counters extends Component {
  render() {
    const { onReset, onDelete, onIncrease, counters } = this.props;
    return (
      <div>
        <button onClick={onReset} className="btn btn-lg btn-primary m-2">
          Reset
        </button>
        {counters.map((each) => (
          <Counter
            key={each.id}
            onDelete={onDelete}
            onIncrease={onIncrease}
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
