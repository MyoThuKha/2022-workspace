//useState
import { useState } from "react";
import React from "react";
import BlogList from "./BlogList";
import { useEffect } from "react";

const Home = () => {
  //destructuring
  const [name, newName] = useState("Mg Mg");
  const [age, newAge] = useState(18);

  const [blogs, setBlogs] = useState([
    {
      title: "My new website",
      content: "Lorem ipsum ...",
      author: "mario",
      id: 1,
    },
    {
      title: "Welcome party",
      content: "Lorem ipsum ...",
      author: "princess peach",
      id: 2,
    },
    {
      title: "Web dev tools",
      content: "Web dev tools are awesome",
      author: "mario",
      id: 3,
    },
  ]);

  //update
  const updateVar = () => {
    newName("Aye Aye");
    newAge(23);
  };

  useEffect(() => {
    //dont change state here, will run infinite loop
    console.log("useEffect ran");
    console.log(name);
  }, [name]);

  const handleDelete = (id) => {
    const newBlogs = blogs.filter((blog) => blog.id !== id);
    setBlogs(newBlogs);
  };

  return (
    <React.Fragment>
      <div className="container h4 mb-5">HomePage</div>
      <button onClick={updateVar} className="btn btn-primary">
        Click me
      </button>
      <div>
        {name} is {age} years old.
      </div>
      <BlogList
        blogs={blogs}
        title="Home"
        handleDelete={handleDelete}
      ></BlogList>
      <BlogList
        blogs={blogs.filter((blog) => blog.author === "mario")}
        title="Mario"
        handleDelete={handleDelete}
      ></BlogList>
    </React.Fragment>
  );
};

export default Home;
