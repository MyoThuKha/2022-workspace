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
      delay: 2,
      type: "spring",
      stiffness: 100,
    },
  },
};

const nextVarients = {
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

const Base = ({ addBase, pizza }) => {
  const bases = ["Classic", "Thin & Crispy", "Thick Crust"];

  return (
    <motion.div
      variants={containerVarients}
      initial="before"
      animate="after"
      className="base container"
    >
      <h3>Step 1: Choose Your Base</h3>
      <ul>
        {bases.map((base) => {
          let spanClass = pizza.base === base ? "active" : "";
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
              key={base}
              onClick={() => addBase(base)}
            >
              <span className={spanClass}>{base}</span>
            </motion.li>
          );
        })}
      </ul>

      {pizza.base && (
        <motion.div className="next" variants={nextVarients}>
          <Link to="/toppings">
            <motion.button variants={buttonVarients} whileHover="hover">
              Next
            </motion.button>
          </Link>
        </motion.div>
      )}
    </motion.div>
  );
};

export default Base;
