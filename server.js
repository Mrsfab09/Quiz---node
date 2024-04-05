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
    } else {
      res.writeHead(404, { "content-type": "text/html" });
      res.end(JSON.stringify(data));
    }
    
const questions = JSON.parse(data).questions;

res.writeHead(200, { "Content-Type": "text/html" });
questions.forEach((question, index) => {
  res.write(`<h3>${index + 1}. ${question.header}</h3>`);
  res.write(`<button class="option" data-index="${index}" data-answer="${question.answer}">Zobacz odpowiedź</button><br><br>`);
});
res.end();
  })
  .listen(3000);

console.log("✔ Connected to server");

//-----------------------------------------------------------------