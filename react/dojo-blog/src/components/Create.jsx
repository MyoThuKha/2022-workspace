import React, { useState } from "react";
import { useHistory } from "react-router-dom";

const Create = () => {
  const style = {
    maxWidth: 400,
  };
  const [title, setTitle] = useState("");
  const [body, setBody] = useState("");
  const [author, setAuthor] = useState("yoshi");
  const [isPending, setPending] = useState(false);
  const history = useHistory();

  const reset = () => {
    setTitle("");
    setBody("");
    setAuthor("yoshi");
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const result = { title, body, author };
    console.log(result);
    setPending(true);

    fetch("http://localhost:8000/blogs/", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(result),
    }).then(() => {
      console.log("updated json data");
      setPending(false);

      //go back one time
      // history.go(-1);
      history.push("/");
    });
  };

  return (
    <React.Fragment>
      <div style={style} className="mx-5 text-center mx-auto ">
        <div className="h3 text-danger mb-5">Create new Blog</div>
        <form onSubmit={handleSubmit} className="">
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
          {!isPending && (
            <React.Fragment>
              <button className="btn btn-success mx-2">Add Blog</button>
              <button
                onClick={reset}
                className="btn btn-outline-secondary mx-2"
              >
                Cancel
              </button>
            </React.Fragment>
          )}
          {isPending && (
            <button disabled className="btn btn-success mx-2">
              Adding...
            </button>
          )}
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
