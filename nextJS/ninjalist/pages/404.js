import Link from "next/link";
import Head from "next/head";
import { useRouter } from "next/router";
import { useEffect } from "react";
import React from "react";

const NotFound = () => {
  const route = useRouter();
  useEffect(() => {
    setTimeout(() => {
      route.push("/");
    }, 4000);
  }, [route]);
  return (
    <React.Fragment>
      <Head>
        <title>Not Found</title>
      </Head>
      <div className="notFound">
        <h1>Page not Found</h1>
        <p>
          Go back to{" "}
          <Link href="/">
            <a>Home</a>
          </Link>
        </p>
      </div>
    </React.Fragment>
  );
};

export default NotFound;
