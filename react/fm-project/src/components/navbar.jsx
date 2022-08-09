import React from "react";

const NavBar = () => {
  return (
    <React.Fragment>
      <nav className="navbar navbar-expand-md navbar-black bg-black border-bottom p-3">
        <div className="container-xxl">
          {/* <a href="." className="navbar-brand ">
            <span className="text-white ">Home</span>
          </a> */}
          {/* toggle button for mobile nav */}
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#main-nav"
            aria-controls="main-nav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="main-nav">
            <ul className="navbar-nav">
              <li className="navbar-item">
                <a href="." className="nav-link text-white">
                  Home
                </a>
              </li>
              <li className="navbar-item">
                <a href="." className="nav-link text-white">
                  About
                </a>
              </li>
              <li className="navbar-item">
                <a
                  href="https://github.com/MyoThuKha"
                  className="nav-link text-white"
                  target="_blank"
                  rel="noreferrer"
                >
                  Projects
                </a>
              </li>
              <li className="navbar-item">
                <a href="." className="nav-link text-white">
                  Blog
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
};

export default NavBar;
