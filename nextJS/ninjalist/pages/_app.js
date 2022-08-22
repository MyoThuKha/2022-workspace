import FooterBar from "../components/footer";
import NavBar from "../components/navbar";
import "../styles/globals.css";

function MyApp({ Component, pageProps }) {
  return (
    <div className="content">
      <NavBar />
      <Component {...pageProps} />
      <FooterBar />
    </div>
  );
}

export default MyApp;
