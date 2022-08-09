import React from "react";

const NavBar = () => {
  return (
    <React.Fragment>
      <nav className="navbar sticky-top navbar-expand-md navbar-dark bg-black border-bottom p-3">
        <div className="container-xxl justify-content-end">
          {/* <a href="." className="navbar-brand ">
            <span className="text-white ">Home</span>
          </a> */}
          {/* toggle button for mobile nav */}
          <button
            className="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target=".main-nav"
            aria-controls="main-nav"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon text-white"></span>
          </button>
          <div className="collapse navbar-collapse main-nav">
            <ul className="navbar-nav">
              <li className="navbar-item">
                <a href="#home" className="nav-link text-white">
                  Home
                </a>
              </li>
              <li className="navbar-item">
                <a href="#about" className="nav-link text-white">
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

          {/* Contact */}
          <div
            className="collapse navbar-collapse justify-content-end main-nav"
            // id="main-nav"
          >
            <a
              href="mailto:myothukha@outlook.sg"
              className="nav-link text-white"
            >
              Contact
            </a>
          </div>
        </div>
      </nav>
    </React.Fragment>
  );
};

export default NavBar;
