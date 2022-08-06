import React, { Component } from "react";
import Counter from "./counter";

class Counters extends Component {
  state = {
    counters: [
      { id: 1, value: 4 },
      { id: 2, value: 0 },
      { id: 3, value: 9 },
      { id: 4, value: 3 },
    ],
  };

  handleDelete = (counterId) => {
    // console.log(counterId);
    const counters = this.state.counters.filter((c) => c.id !== counterId);
    this.setState({ counters });
  };

  handleIncrement = (counter) => {
    let counters = [...this.state.counters];
    const index = counters.indexOf(counter);
    counters[index] = { ...counter };
    counters[index].value++;
    this.setState({ counters });
  };

  handleReset = () => {
    const counters = this.state.counters.map((c) => {
      c.value = 0;
      return c;
    });
    // console.log(counters);
    this.setState({ counters });
  };
  render() {
    return (
      <div>
        <button
          onClick={this.handleReset}
          className="btn btn-lg btn-primary m-2"
        >
          Reset
        </button>
        {this.state.counters.map((each) => (
          <Counter
            key={each.id}
            onDelete={this.handleDelete}
            onIncrease={this.handleIncrement}
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
