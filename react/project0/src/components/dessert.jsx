import { motion } from "framer-motion";
const Dessert = () => {
  const dessertList = [
    { name: "Donut", id: 1 },
    { name: "Cherry Pie", id: 2 },
    { name: "Cheesecake", id: 3 },
    { name: "Cinnamon Roll", id: 4 },
  ];
  const setCoffee = (coffee) => {
    console.log(coffee);
  };
  return (
    <div className="home">
      <motion.div className="hello text-center">
        <div className="d-block h2 text-center text-white my-5">
          Choose your Desserts
        </div>
        <div className="text-start">
          {dessertList.map((each) => (
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
          <motion.button className="mt-3 text-white">Next</motion.button>
        </div>
      </motion.div>
    </div>
  );
};

export default Dessert;
