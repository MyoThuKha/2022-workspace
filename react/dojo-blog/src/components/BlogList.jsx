import React from "react";

const BlogList = ({ blogs, title }) => {
  return (
    <React.Fragment>
      <div className="h2">{title}</div>
      {blogs.map((blog) => (
        <div key={blog.id} className="blogList">
          <div className="h1">{blog.title}</div>
          <div className="lead">{blog.content}</div>
        </div>
      ))}
    </React.Fragment>
  );
};

export default BlogList;
