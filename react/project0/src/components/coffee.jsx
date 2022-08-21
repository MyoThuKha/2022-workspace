import { motion } from "framer-motion";

const Coffee = () => {
  const coffeeList = [
    { name: "French Vanilla", id: 1 },
    { name: "Caramel Macchiato", id: 2 },
    { name: "Pumpkin", id: 3 },
    { name: "Hazelnut", id: 4 },
    { name: "Mocha", id: 5 },
  ];

  const setCoffee = (coffee) => {
    console.log(coffee);
  };
  return (
    <div className="home">
      <motion.div className="hello text-center">
        <div className="d-block h2 text-center text-white my-5">
          Choose your Coffee
        </div>
        <div>
          {coffeeList.map((each) => (
            <div
              onClick={() => {
                setCoffee(each.name);
              }}
              className="text-white fs-5 text-start mb-3"
              key={each.id}
            >
              {each.name}
            </div>
          ))}
          <motion.button className="text-white text-start">Next</motion.button>
        </div>
      </motion.div>
    </div>
  );
};

export default Coffee;
