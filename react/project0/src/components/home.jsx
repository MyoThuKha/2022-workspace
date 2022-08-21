import React from "react";
import { motion } from "framer-motion";

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

const buttonVariants = {
  hover: {
    scale: 1.1,
  },
};
const Home = () => {
  return (
    <div className="home">
      <motion.div
        variants={textVariants}
        initial="before"
        animate="after"
        className="hello text-center"
      >
        <div className="d-block display-3 text-center text-white mb-5">
          Welcome to Coffee Site.
        </div>
        <motion.button
          variants={buttonVariants}
          whileHover="hover"
          className="text-white"
        >
          Order
        </motion.button>
      </motion.div>
    </div>
  );
};

export default Home;
