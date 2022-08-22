import styles from "../styles/Home.module.css";
import Link from "next/link";
import Head from "next/head";
import React from "react";

export default function Home() {
  return (
    <React.Fragment>
      <Head>
        <title>Ninja Site - Home</title>
        <meta name="keywords" content="ninjas"></meta>
      </Head>
      <div className={styles.title}>
        <h1>Home</h1>
        <p className={styles.text}>
          Lorem ipsum dolor sit, amet consectetur adipisicing elit. Beatae
          pariatur minus ea eligendi asperiores suscipit aut molestiae porro
          consequuntur corporis, dolore amet iste repellendus ipsam, ducimus
          totam labore nobis omnis?
        </p>
        <p className={styles.text}>
          Lorem ipsum dolor sit, amet consectetur adipisicing elit. Beatae
          pariatur minus ea eligendi asperiores suscipit aut molestiae porro
          consequuntur corporis, dolore amet iste repellendus ipsam, ducimus
          totam labore nobis omnis?
        </p>
        <Link href="/ninjas">
          <a className={styles.btn}>Go to Ninja Listing</a>
        </Link>
      </div>
    </React.Fragment>
  );
}
