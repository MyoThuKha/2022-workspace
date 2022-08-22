import Link from "next/link";
import { useRouter } from "next/router";
import { useEffect } from "react";

const NotFound = () => {
  const route = useRouter();
  useEffect(() => {
    setTimeout(() => {
      route.push("/");
    }, 4000);
  }, [route]);
  return (
    <div className="notFound">
      <h1>Page not Found</h1>
      <p>
        Go back to{" "}
        <Link href="/">
          <a>Home</a>
        </Link>
      </p>
    </div>
  );
};

export default NotFound;
