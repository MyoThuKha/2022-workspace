import React from "react";

const Create = () => {
  const style = {
    maxWidth: 400,
  };
  return (
    <React.Fragment>
      <div style={style} className="mx-5 text-center mx-auto ">
        <div className="h3 text-danger mb-5">Create new Blog</div>
        <form className="">
          <label className="d-block mb-2 text-start">Blog title: </label>
          <input required className="d-block mb-4 w-100"></input>
          <label className="d-block mb-2 text-start">Blog body: </label>
          <textarea required className="d-block mb-4 w-100"></textarea>
          <label className="d-block mb-2 text-start">Author </label>
          <select className="d-block mb-5 w-100">
            <option value="mario">Mario</option>
            <option value="yoshi">Yoshi</option>
          </select>
          <button className="btn btn-success mx-2">Submit</button>
          <button className="btn btn-secondary mx-2">Cancel</button>
        </form>
      </div>
    </React.Fragment>
  );
};

export default Create;
