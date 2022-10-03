const express = require("express");

const app = express();

app.set("view engine", "ejs");
app.set("views", "pages");

app.listen(3000);

app.use((req, res, next) => {
  console.log(req.url);
  next();
});

app.get("/", (req, res) => {
  res.render("index", { title: "Home" });
});

app.get("/about", (req, res) => {
  res.render("about", { title: "About us" });
});
app.get("/create", (req, res) => {
  res.render("create", { title: "Create Blogs" });
});

app.use((req, res) => {
  res.status(404).render("404", { title: "Page Not Found" });
});
