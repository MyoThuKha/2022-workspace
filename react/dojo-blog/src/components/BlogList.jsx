import React from "react";

const BlogList = ({ blogs, title }) => {
  return (
    <div className="m-4">
      <div className="h2">{title}</div>
      {blogs.map((blog) => (
        <div key={blog.id}>
          <div className="text-danger h3">{blog.title}</div>
          <div>{blog.body}</div>
        </div>
      ))}
    </div>
  );
};

export default BlogList;
