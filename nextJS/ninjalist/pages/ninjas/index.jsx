import React from "react";
import styles from "../../styles/Ninjas.module.css";

export const getStaticProps = async () => {
  const res = await fetch("https://jsonplaceholder.typicode.com/users");
  const data = await res.json();
  return {
    props: { data },
  };
};

const Test = ({ data: ninjas }) => {
  return (
    <React.Fragment>
      <h1>Ninjas</h1>
      {ninjas.map((each) => (
        <div key={each.id}>
          <a className={styles.single}>
            <h3>{each.name}</h3>
          </a>
        </div>
      ))}
    </React.Fragment>
  );
};

export default Test;
