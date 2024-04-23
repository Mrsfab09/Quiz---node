var mysql = require("mysql");

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "quiz",
});

module.exports = db;
