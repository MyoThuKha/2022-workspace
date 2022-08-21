import { motion } from "framer-motion";
import { useState } from "react";
import { Link } from "react-router-dom";
const Dessert = () => {
  const dessertList = [
    { name: "Donut", id: 1 },
    { name: "Cherry Pie", id: 2 },
    { name: "Cheesecake", id: 3 },
    { name: "Cinnamon Roll", id: 4 },
  ];
  const [current, setCurrent] = useState("");

  const handleClick = (coffee) => {
    setCurrent(coffee);
  };

  return (
    <div className="centerDiv">
      <motion.div className="hello text-center">
        <div className="d-block h2 text-center text-white my-5">
          Choose your Desserts
        </div>
        <div className="text-start">
          {dessertList.map((each) => (
            <div
              onClick={() => {
                handleClick(each.name);
              }}
              className="text-white fs-5 text-start mb-3"
              key={each.id}
            >
              {current === each.name ? (
                <div className="activeItem">
                  <div className="bulletIcon "></div>
                  <div className="ms-2 d-inline-block fs-3">{each.name}</div>
                </div>
              ) : (
                <div>{each.name}</div>
              )}
            </div>
          ))}
          <Link to="/orders">
            <motion.button className="mt-3 text-white">Next</motion.button>
          </Link>
        </div>
      </motion.div>
    </div>
  );
};

export default Dessert;
