import React from "react";
import { AnimatePresence, motion } from "framer-motion";
import { Link } from "react-router-dom";

const modalVariant = {
  hidden: {
    opacity: 0,
  },
  visible: {
    opacity: 1,
  },
};
const modalBoxVariant = {
  hidden: {
    y: "-100vh",
  },
  visible: {
    y: "200px",
    transition: {
      type: "spring",
      stiffness: 300,
    },
  },
};
const Modal = ({ showModal }) => {
  return (
    <React.Fragment>
      <AnimatePresence exitBeforeEnter>
        {showModal && (
          <motion.div
            variants={modalVariant}
            initial="hidden"
            animate="visible"
            exit="hidden"
            className="backdrop"
          >
            <motion.div variants={modalBoxVariant} className="modal">
              <p>Create another Pizza?</p>
              <Link to="/">
                <button>Restart</button>
              </Link>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </React.Fragment>
  );
};

export default Modal;
