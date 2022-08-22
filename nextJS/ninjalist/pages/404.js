import Link from "next/link";

const NotFound = () => {
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
