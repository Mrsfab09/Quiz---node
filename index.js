function alert() {
  Swal.fire({
    title: "Good job!",
    text: "You clicked the button!",
    icon: "success",
  });
}

//https://www.youtube.com/watch?v=LJ4PZ8JnRCg

// var http = require("http");
// var fs = require("fs");

// var data = {
//   id: 456,
//   name: "Node.js",
//   category: "js",
// };

// http
//   .createServer((req, res) => {
//     if (req.url === "/") {
//       res.writeHead(200, { "content-type": "text/html" });
//       var html = fs.readFileSync("./index.html", "utf-8");

//       res.end(html);
//     } else if (req.url === "/quiz") {
//       res.writeHead(200, { "content-type": "text/html" });
//       var html = fs.readFileSync("./quiz.html", "utf-8");
//       res.end(html);
//     } else {
//       res.writeHead(404, { "content-type": "text/html" });
//       res.end(JSON.stringify(data));
//     }
//   })
//   .listen(3000);

// console.log("✔ Connected to server");
