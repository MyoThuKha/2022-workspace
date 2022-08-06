import React, { Component } from "react";
import Counter from "./counter";

class Counters extends Component {
  state = {
    counters: [
      { id: 1, value: 4 },
      { id: 2, value: 1 },
      { id: 3, value: 9 },
      { id: 4, value: 3 },
    ],
  };
  render() {
    return (
      <div>
        {this.state.counters.map((each) => (
          <Counter key={each.id} value={each.value} />
        ))}
      </div>
    );
  }
}

export default Counters;
