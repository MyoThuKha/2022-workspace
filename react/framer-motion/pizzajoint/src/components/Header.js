import React from "react";
import { Link } from "react-router-dom";
import { motion } from "framer-motion";

const svgVariant = {
  before: {
    rotateZ: -180,
  },
  after: {
    rotateZ: 0,
    transition: {
      duration: 1,
    },
  },
};
const pathVariant = {
  before: {
    opacity: 0,
    pathLength: 0,
  },
  after: {
    opacity: 1,
    pathLength: 1,
    transition: {
      duration: 1,
      ease: "easeInOut",
    },
  },
};
const Header = () => {
  return (
    <header>
      <div className="logo">
        <motion.svg
          variants={svgVariant}
          initial="before"
          animate="after"
          className="pizza-svg"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 100 100"
        >
          <motion.path
            variants={pathVariant}
            fill="none"
            d="M40 40 L80 40 C80 40 80 80 40 80 C40 80 0 80 0 40 C0 40 0 0 40 0Z"
          />
          <path fill="none" d="M50 30 L50 -10 C50 -10 90 -10 90 30 Z" />
        </motion.svg>
      </div>
      <motion.div
        initial={{ y: -300 }}
        animate={{ y: -30 }}
        transition={{ delay: 1.2, type: "spring", stiffness: 180 }}
        className="title"
      >
        <Link to="/">
          <h1>Pizza Joint</h1>
        </Link>
      </motion.div>
    </header>
  );
};

export default Header;
