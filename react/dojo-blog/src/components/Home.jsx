//useState
import { useState } from "react";
import React from "react";
import BlogList from "./BlogList";
import { useEffect } from "react";

const Home = () => {
  //destructuring
  const [name, newName] = useState("Mg Mg");
  const [age, newAge] = useState(18);
  const [blogs, setBlogs] = useState(null);
  const [pending, setPending] = useState(true);

  useEffect(() => {
    //dont change state here, will run infinite loop
    fetch("http://localhost:8000/blogs")
      .then((res) => {
        return res.json();
      })
      .then((data) => {
        setBlogs(data);
        setPending(false);
      });
  }, []);

  //update
  const updateVar = () => {
    newName("Aye Aye");
    newAge(23);
  };

  // const handleDelete = (id) => {
  //   const newBlogs = blogs.filter((blog) => blog.id !== id);
  //   setBlogs(newBlogs);
  // };

  return (
    <React.Fragment>
      <div className="container h4 mb-5">HomePage</div>
      <button onClick={updateVar} className="btn btn-primary">
        Click me
      </button>
      <div>
        {name} is {age} years old.
      </div>
      {pending && <div>Loading... </div>}

      {blogs && <BlogList blogs={blogs} title="Home"></BlogList>}
    </React.Fragment>
  );
};

export default Home;
