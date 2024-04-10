const http = require("http");
const fs = require("fs");

http.createServer((req, res) => {
  if (req.url === "/") {
    res.writeHead(200, { "content-type": "text/html" });
    const html = fs.readFileSync("./index.html", "utf-8");
    res.end(html);
  } else if (req.url === "/quiz") {
    fs.readFile("db.json", "utf-8", (err, jsonData) => {
      if (err) {
        res.writeHead(500, { "Content-Type": "text/plain" });
        res.end("Błąd odczytu pliku JSON");
        return;
      }
      try {
        const questionsData = JSON.parse(jsonData);
        fs.readFile("quiz.html", "utf-8", (err, quizHtml) => {
          if (err) {
            res.writeHead(500, { "Content-Type": "text/plain" });
            res.end("Błąd odczytu pliku HTML");
            return;
          }
          res.writeHead(200, { "content-type": "text/html" });
          let html = "<h1>Quiz</h1>";
          html += "<ol>";
          questionsData.questions.forEach((question, index) => {
            html += `<li>${question.header}</li>`;
          });
          html += "</ol>";
          html += quizHtml;
          res.end(html);
        });
      } catch (error) {
        res.writeHead(500, { "Content-Type": "text/plain" });
        res.end("Błąd parsowania danych JSON");
      }
    });
  } else {
    res.writeHead(404, { "content-type": "text/html" });
    res.end("<h1>404 Not Found</h1>");
  }
}).listen(3000);

console.log("✔ Connected to server");