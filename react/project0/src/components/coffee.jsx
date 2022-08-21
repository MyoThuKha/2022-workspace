import { motion } from "framer-motion";
import { useState } from "react";
import React from "react";
import { Link } from "react-router-dom";

const Coffee = () => {
  const coffeeList = [
    { name: "French Vanilla", id: 1 },
    { name: "Caramel Macchiato", id: 2 },
    { name: "Pumpkin", id: 3 },
    { name: "Hazelnut", id: 4 },
    { name: "Mocha", id: 5 },
  ];
  const [current, setCurrent] = useState("");

  const handleClick = (coffee) => {
    setCurrent(coffee);
  };

  return (
    <div className="centerDiv">
      <motion.div className="hello text-center">
        <div className="d-block h2 text-center text-white my-5">
          Choose your Coffee
        </div>
        <div className="text-start">
          {coffeeList.map((each) => (
            <div
              onClick={() => handleClick(each.name)}
              className="text-white fs-5 text-start mb-3"
              key={each.id}
            >
              {current === each.name ? (
                <div className="activeItem">
                  <div className="bulletIcon "></div>
                  <div className="ms-2 d-inline-block fs-3">{each.name}</div>
                </div>
              ) : (
                <div>{each.name}</div>
              )}
            </div>
          ))}
          <Link to="/dessert">
            <motion.button className="mt-3 text-white">Next</motion.button>
          </Link>
        </div>
      </motion.div>
      {/* <div>{current}</div> */}
    </div>
  );
};

export default Coffee;
