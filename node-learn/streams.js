const fs = require("fs");

const readStream = fs.createReadStream("./docs/blog2.txt", {
  encoding: "utf-8",
});
const writeStream = fs.createWriteStream("./docs/blog3.txt");

readStream.pipe(writeStream);
