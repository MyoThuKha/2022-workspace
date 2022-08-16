import React from "react";
import { useParams } from "react-router-dom";

const BlogDetails = () => {
  const { id } = useParams();
  return (
    <React.Fragment>
      <div className="h3">Blog details {id}</div>
    </React.Fragment>
  );
};

export default BlogDetails;
