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
      // delay: 1.4,
      type: "spring",
      stiffness: 100,
    },
  },
  exit: {
    x: "-100vw",
    transition: {
      ease: "easeInOut",
    },
  },
};

const orderVarients = {
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

const buttonVarients = {
  hover: {
    // keyframes is not in transition
    scale: 1.1,
    textShadow: "0px 0px 8px #ffffff",
    boxShadow: "0px 0px 8px #ffffff",
    transition: {
      yoyo: Infinity,
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
      exit="exit"
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

      <motion.div variants={orderVarients}>
        <Link to="/order">
          <motion.button variants={buttonVarients} whileHover="hover">
            Order
          </motion.button>
        </Link>
      </motion.div>
    </motion.div>
  );
};

export default Toppings;
