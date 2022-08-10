import React from "react";

const NavBar = () => {
  return (
    <React.Fragment>
      <nav className="navbar sticky-top navbar-expand-md navbar-dark bg-black border-bottom p-3">
        <div className="container-fluid justify-content-end">
          {/* <a href="." className="navbar-brand ">
            <span className="text-white ">Home</span>
          </a> */}
          {/* toggle button for mobile nav */}
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#mainNav"
            aria-controls="mainNav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon"></span>
          </button>
          <div
            className="collapse navbar-collapse justify-content-between"
            id="mainNav"
          >
            {/* nav items */}

            <div className="navbar-nav">
              <a href="#home" className="nav-link text-white">
                Home
              </a>
              <a href="#about" className="nav-link text-white">
                About
              </a>
              <a
                href="https://github.com/MyoThuKha"
                className="nav-link text-white"
                target="_blank"
                rel="noreferrer"
              >
                Projects
              </a>
              <a href="." className="nav-link text-white">
                Blog
              </a>
            </div>

            {/* Contact */}
            <div className="navbar-nav justify-content-end">
              <a
                href="mailto:myothukha.dev@gmail.com"
                className="nav-link text-white"
              >
                Contact
              </a>
            </div>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
};

export default NavBar;
