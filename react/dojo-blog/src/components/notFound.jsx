import React from "react";
import { Link } from "react-router-dom";

const NotFound = () => {
  return (
    <React.Fragment>
      <div className="text-danger display-2">404 Not Found</div>
      <div className="mt-4 mb-2 fs-5">Look like Page doesn't exist.</div>
      <Link to="/" className="text-decoration-none text-info">
        Go Back to Home
      </Link>
    </React.Fragment>
  );
};

export default NotFound;
