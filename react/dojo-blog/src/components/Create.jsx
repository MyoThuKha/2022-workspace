import React, { useState } from "react";

const Create = () => {
  const style = {
    maxWidth: 400,
  };
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [author, setAuthor] = useState("yoshi");

  return (
    <React.Fragment>
      <div style={style} className="mx-5 text-center mx-auto ">
        <div className="h3 text-danger mb-5">Create new Blog</div>
        <form className="">
          <label className="d-block mb-2 text-start text-secondary">
            Blog title:{" "}
          </label>
          <input
            required
            value={title}
            onChange={(e) => setTitle(e.target.value)}
            className="d-block mb-4 w-100"
          />
          <label className="d-block mb-2 text-start text-secondary">
            Blog body:{" "}
          </label>
          <textarea
            required
            value={body}
            onChange={(e) => setBody(e.target.value)}
            style={{ height: 200 }}
            className="d-block mb-4 w-100"
          ></textarea>
          <label className="d-block mb-2 text-start text-secondary">
            Author{" "}
          </label>
          <select
            value={author}
            onChange={(e) => setAuthor(e.target.value)}
            className="d-block mb-5 w-100"
          >
            <option value="mario">Mario</option>
            <option value="yoshi">Yoshi</option>
          </select>
          <button className="btn btn-success mx-2">Submit</button>
          <button className="btn btn-outline-secondary mx-2">Cancel</button>
        </form>
      </div>
      <h2 className="my-5 text-info">Preview</h2>
      <div className="h2 text-danger">{title}</div>
      <div className="text-secondary my-2 fs-5">By {author}</div>
      <div className="my-2">{body}</div>
    </React.Fragment>
  );
};

export default Create;
