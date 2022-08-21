import React from "react";
import { motion } from "framer-motion";
import { Link } from "react-router-dom";

const textVariants = {
  before: {
    opacity: 0,
  },
  after: {
    opacity: 1,
    transition: {
      duration: 1.5,
      when: "beforeChildren",
    },
  },
};

const buttonMoveVariant = {
  before: {
    opacity: 0,
  },
  after: {
    opacity: 1,
    transition: {
      duration: 1.2,
    },
  },
};

const buttonVariants = {
  hover: {
    scale: 1.1,
    // textShadow: "0px 0px 5px white",
    // boxShadow: "0px 0px 5px white",
  },
};
const Home = () => {
  return (
    <div className="centerDiv">
      <motion.div
        variants={textVariants}
        initial="before"
        animate="after"
        className="hello text-center"
      >
        <div className="d-block display-3 text-center text-white mb-5">
          Welcome to CAMPER CAFE.
        </div>
        <motion.div variants={buttonMoveVariant}>
          <Link to="/coffee">
            <motion.button
              variants={buttonVariants}
              whileHover="hover"
              className="text-white"
            >
              Order
            </motion.button>
          </Link>
        </motion.div>
      </motion.div>
    </div>
  );
};

export default Home;
