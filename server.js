var http = require("http");
var fs = require("fs");
var html = fs.readFileSync("./public/script.js", "utf-8");

var data = {
  id: 456,
  name: "Node.js",
  category: "js",
};

var http = require("http");
var fs = require("fs");

var data = {
  id: 456,
  name: "Node.js",
  category: "js",
};

http
  .createServer((req, res) => {
    if (req.url === "/") {
      res.writeHead(200, { "content-type": "text/html" });
      var html = fs.readFileSync("./index.html", "utf-8");
      res.end(html);
    } else if (req.url === "/quiz") {
      res.writeHead(200, { "content-type": "text/html" });
      var html = fs.readFileSync("./quiz.html", "utf-8");
      res.end(html);
    } else if (req.url === "/public/script.js") {
      // Obsługa żądania dla pliku script.js
      fs.readFile("./public/script.js", (err, data) => {
        if (err) {
          res.writeHead(404, { "content-type": "text/plain" });
          res.end("File not found");
        } else {
          res.writeHead(200, { "content-type": "text/javascript" });
          res.end(data);
        }
      });
    } else {
      res.writeHead(404, { "content-type": "text/html" });
      res.end(JSON.stringify(data));
    }
  })
  .listen(3000);

console.log("✔ Connected to server");

//https://www.youtube.com/watch?v=PBcqGxrr9g8
