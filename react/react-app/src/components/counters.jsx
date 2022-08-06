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

  handleDelete = (counterId) => {
    // console.log(counterId);
    const counters = this.state.counters.filter((c) => c.id !== counterId);
    this.setState({ counters });
  };
  render() {
    return (
      <div>
        {this.state.counters.map((each) => (
          <Counter
            key={each.id}
            onDelete={this.handleDelete}
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
