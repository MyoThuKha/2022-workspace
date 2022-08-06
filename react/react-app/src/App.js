import React, { Component } from "react";
import NavBar from "./components/navbar";
import Counters from "./components/counters";
class App extends Component {
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
      <React.Fragment>
        <NavBar></NavBar>{" "}
        <main className="container">
          <Counters
            counters={this.state.counters}
            onDelete={this.handleDelete}
            onIncrease={this.handleIncrement}
            onReset={this.handleReset}
          ></Counters>
        </main>
      </React.Fragment>
    );
  }
}

export default App;
