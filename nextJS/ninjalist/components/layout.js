import FooterBar from "./footer";
import NavBar from "./navbar";

const Layout = ({ childComponent }) => {
  return (
    <div>
      <NavBar />
      {childComponent}
      <FooterBar />
    </div>
  );
};

export default Layout;
