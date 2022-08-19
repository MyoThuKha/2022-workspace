import React from "react";
import { Link } from "react-router-dom";
import { motion } from "framer-motion";

const containerVarients = {
  before: {
    opacity: 0,
    x: "100vw",
  },
  after: {
    opacity: 1,
    x: 0,
    transition: {
      delay: 1.4,
      type: "spring",
      stiffness: 100,
    },
  },
};

const buttonVarients = {
  before: {
    opacity: 0,
    x: "-100vw",
  },
  after: {
    opacity: 1,
    x: 0,
    transition: {
      type: "spring",
      stiffness: 80,
    },
  },
};

const Toppings = ({ addTopping, pizza }) => {
  let toppings = [
    "mushrooms",
    "peppers",
    "onions",
    "olives",
    "extra cheese",
    "tomatoes",
  ];

  return (
    <motion.div
      className="toppings container"
      variants={containerVarients}
      initial="before"
      animate="after"
    >
      <h3>Step 2: Choose Toppings</h3>
      <ul>
        {toppings.map((topping) => {
          let spanClass = pizza.toppings.includes(topping) ? "active" : "";
          return (
            <motion.li
              whileHover={{
                color: "orange",
                scale: 1.3,
                originX: 0,
              }}
              transition={{
                type: "spring",
                stiffness: 200,
              }}
              key={topping}
              onClick={() => addTopping(topping)}
            >
              <span className={spanClass}>{topping}</span>
            </motion.li>
          );
        })}
      </ul>

      <motion.div variants={buttonVarients}>
        <Link to="/order">
          <motion.button
            whileHover={{
              textShadow: "0px 0px 8px #ffffff",
              boxShadow: "0px 0px 8px #ffffff",
            }}
          >
            Order
          </motion.button>
        </Link>
      </motion.div>
    </motion.div>
  );
};

export default Toppings;
