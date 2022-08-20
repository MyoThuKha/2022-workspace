import React from "react";
import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";

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
  const [showTitle, setShowTitle] = useState(true);

  setTimeout(() => {
    setShowTitle(false);
  }, 4000);

  return (
    <motion.div
      variants={containerVarients}
      initial="before"
      animate="after"
      className="container order"
    >
      <AnimatePresence>
        {showTitle && (
          <motion.h2 exit={{ opacity: 0 }}>
            Thank you for your order :)
          </motion.h2>
        )}
      </AnimatePresence>
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
