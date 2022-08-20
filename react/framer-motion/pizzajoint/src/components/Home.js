import React from "react";
import { Link } from "react-router-dom";
import { motion } from "framer-motion";

const homeContainerVariants = {
  before: {
    opacity: 0,
  },
  after: {
    opacity: 1,
    transition: {
      delay: 1.5,
      duration: 1.5,
    },
  },
  exit: {
    x: "-100vw",
    transition: {
      ease: "easeInOut",
    },
  },
};

const buttonVariants = {
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
const Home = () => {
  return (
    <motion.div
      variants={homeContainerVariants}
      initial="before"
      animate="after"
      exit="exit"
      className="home container"
    >
      {/* x positive left / negative right y positive down negative up */}
      <h2 animate={{}}>Welcome to Pizza Joint</h2>
      <Link to="/base">
        <motion.button variants={buttonVariants} whileHover="hover">
          Create Your Pizza
        </motion.button>
      </Link>
    </motion.div>
  );
};

export default Home;
