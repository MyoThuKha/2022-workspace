const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  console.log(req.url, req.method);

  //
  res.setHeader("Content-Type", "text/html");
  //get html file
  fs.readFile("./views/index.html", (err, data) => {
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
