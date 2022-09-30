const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  console.log(req.url, req.method);

  //routes
  let path = "./views/";
  switch (req.url) {
    case "/":
      path += "index.html";
      res.statusCode = 200;
      break;
    case "/about":
      path += "about.html";
      res.statusCode = 200;
      break;
    case "/about-us":
      res.statusCode = 301;
      res.setHeader("Location", "/about");
      break;
    default:
      path += "404.html";
      res.statusCode = 404;
      break;
  }
  res.setHeader("Content-Type", "text/html");
  //get html file
  fs.readFile(path, (err, data) => {
    if (err) {
      res.end();
      console.log(err);
    }
    //if write is only one,can use end
    else res.end(data);
  });
});

server.listen(3000, "localhost", () => {
  console.log("listening on localhost:3000");
});
