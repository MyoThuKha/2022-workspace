import React from "react";

const Home = () => {
  return (
    <React.Fragment>
      <div className="home">
        <div className="hello text-center">
          <div className="d-block display-3 text-center text-white mb-5">
            Welcome to Coffee Site.
          </div>
          <button className="btn rounded-pill btn-outline-light">
            Order Coffee
          </button>
          {/* <button className="btn btn-outline-dark rounded-pill">
            Look Around
          </button> */}
        </div>
      </div>
    </React.Fragment>
  );
};

export default Home;
