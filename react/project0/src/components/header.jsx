import React from "react";
import { Link } from "react-router-dom";

const Header = () => {
  return (
    <React.Fragment>
      <nav className="navbar navbar-dark border-bottom">
        <Link to="/" className="text-decoration-none">
          <div className="container-xxl navbar-brand fs-3">Home</div>
        </Link>
      </nav>
    </React.Fragment>
  );
};

export default Header;
