import { Link } from "react-router-dom";

const NotFound = () => {
  return (
    <div>
      <div className="hello">
        <div className="display-1 fw-semibold text-white my-3">
          Page Doesn't Exist.
        </div>
        <Link to="/" className=" text-decoration-none text-black">
          <div className="display-6">Go back to Home</div>
        </Link>
      </div>
    </div>
  );
};

export default NotFound;
