import React from "react";
import { Link } from "react-router-dom";
import { motion } from "framer-motion";
const Home = () => {
  return (
    <motion.div
      animate={{ rotateZ: 180, marginTop: 300 }}
      className="home container"
    >
      {/* x positive left / negative right y positive down negative up */}
      <motion.h2 animate={{ fontSize: 50, color: "#00ffff", x: 100, y: -100 }}>
        Welcome to Pizza Joint
      </motion.h2>
      <Link to="/base">
        <motion.button animate={{ opacity: 8, scale: 1.5 }}>
          Create Your Pizza
        </motion.button>
      </Link>
    </motion.div>
  );
};

export default Home;
