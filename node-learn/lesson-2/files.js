const fs = require("fs");

//writing file
fs.writeFile("./docs/blog1.txt", "Hi!", () => {
  console.log("file overwritten");
});
//reading file
fs.readFile("./docs/blog1.txt", (err, data) => {
  if (err) return null;
  console.log(data.toString());
});

//create folder

if (!fs.existsSync("./assets")) {
  fs.mkdir("./assets", () => {
    console.log("folder created");
  });
}

if (fs.existsSync("./assets")) {
  fs.rmdir("./assets", () => {
    console.log("folder deleted");
  });
}

fs.unlink("./docs/deleteme.txt", () => {
  console.log("file deleted");
});
