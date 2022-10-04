const express = require("express");
const morgan = require("morgan");
const { dbUrl } = require("./dbUrl");

const app = express();

app.set("view engine", "ejs");
app.set("views", "pages");

app.listen(3000);

app.use(morgan("dev"));
app.use(express.static("public"));

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
