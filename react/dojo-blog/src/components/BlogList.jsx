import React from "react";
import { Link } from "react-router-dom";

const BlogList = ({ blogs, title }) => {
  return (
    <div className="m-4">
      <div className="h2">{title}</div>
      {blogs.map((blog) => (
        <Link to={`/details/${blog.id}`} className="text-decoration-none">
          <div className="border rounded m-5 p-3" key={blog.id}>
            <div className="text-danger h3">{blog.title}</div>
            <div className="text-secondary">By {blog.author}</div>
          </div>
        </Link>
      ))}
    </div>
  );
};

export default BlogList;
