import React from "react";

const BlogList = ({ blogs, title, handleDelete }) => {
  return (
    <div className="m-4">
      <div className="h2">{title}</div>
      {blogs.map((blog) => (
        <div key={blog.id}>
          <div className="text-danger h3">{blog.title}</div>
          <div>{blog.content}</div>
          <button
            onClick={() => {
              handleDelete(blog.id);
            }}
            className="btn btn-danger mt-2 mb-4"
          >
            Delete
          </button>
        </div>
      ))}
    </div>
  );
};

export default BlogList;
