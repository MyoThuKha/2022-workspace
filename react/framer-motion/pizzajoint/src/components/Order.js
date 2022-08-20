import React from "react";
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
      mass: 0.4,
      damping: 8,

      //when make childen animate after this animation
      //without stagger(gap between child animate), children appear same
      when: "beforeChildren",
      staggerChildren: 0.4,
    },
  },
  exit: {
    x: "-100vw",
    transition: {
      ease: "easeInOut",
    },
  },
};

const childVarients = {
  before: {
    opacity: 0,
  },
  after: {
    opacity: 1,
  },
};
const Order = ({ pizza }) => {
  return (
    <motion.div
      variants={containerVarients}
      initial="before"
      animate="after"
      exit="exit"
      className="container order"
    >
      <h2>Thank you for your order :)</h2>
      <motion.p variants={childVarients}>
        You ordered a {pizza.base} pizza with:
      </motion.p>
      <motion.div variants={childVarients}>
        {pizza.toppings.map((topping) => (
          <div key={topping}>{topping}</div>
        ))}
      </motion.div>
    </motion.div>
  );
};

export default Order;
