const http = require("http");

const server = http.createServer((req, res) => {
  console.log(req.url);
});

server.listen(3000, "localhost", () => {
  console.log("listening on localhost:3000");
});
