import React from "react";
import { motion, useCycle } from "framer-motion";

const loadVariant = {
  animationOne: {
    x: [-20, 20],
    y: [0, -30],
    transition: {
      x: {
        yoyo: Infinity,
        duration: 0.5,
      },
      y: {
        yoyo: Infinity,
        duration: 0.25,
      },
    },
  },
  animationTwo: {
    y: [0, -40],
    x: 0,
    transition: {
      yoyo: Infinity,
      duration: 0.5,
    },
  },
};
const Loader = () => {
  const [animation, cycleAnimation] = useCycle("animationOne", "animationTwo");
  return (
    <React.Fragment>
      <motion.div
        variants={loadVariant}
        animate={animation}
        className="loader"
      ></motion.div>
      <div onClick={cycleAnimation}>Change loader</div>
    </React.Fragment>
  );
};

export default Loader;
