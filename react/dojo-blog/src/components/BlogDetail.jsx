import React from "react";
import { useParams } from "react-router-dom";
import useFetch from "../custom_hooks/useFetch";

const BlogDetails = () => {
  const { id } = useParams();
  const { data, pending, errText } = useFetch(
    "http://localhost:8000/blogs/" + id
  );
  return (
    <React.Fragment>
      {/* <div className="h3">Blog details {id}</div> */}
      {errText && <div>errText</div>}
      {pending && <div>Loading</div>}
      {data && (
        <article>
          <div className="h3 text-danger">{data.title}</div>
          <div className="text-secondary fs-5 mb-3">By {data.author}</div>
          <div className="">{data.body}</div>
        </article>
      )}
    </React.Fragment>
  );
};

export default BlogDetails;
