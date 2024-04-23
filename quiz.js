const express = require("express");
const db = require("./connect.js");

const app = express();

app.set("view engine", "jade");
app.use("/assets", express.static("public"));

app.post("/", (req, res) => {
  res.render("quizAppStart", {
    title: "Quiz App",
  });
});
app.get("/", (req, res) => {
  res.render("quizAppStart", {
    title: "Quiz App",
  });
});

app.get("/quiz/:questionID", (req, res) => {
  const { questionID } = req.params;
  const activeIndex = parseInt(questionID);

  db.query("SELECT * FROM question", (error, questionResult) => {
    if (error) {
      console.log("Błąd z odczytem pytań: ", error);
      res.status(404).send("Wystąpił problem podczas odczytu pytań");
      return;
    }

    if (activeIndex >= questionResult.length) {
      res.redirect("/theEnd");
      return;
    }

    const activeQuestion = questionResult[activeIndex];

    db.query(
      "SELECT * FROM answer WHERE id = ?",
      activeQuestion.id,
      (error, answerResult) => {
        if (error) {
          console.log("Błąd przy pobieraniu odpowiedzi", error);
          res.status(404).send("Błąd przy pobieraniu odpowiedzi");
          return;
        }

        res.render("quiz", {
          title: "Quiz",
          questionID: activeIndex,
          question: activeQuestion,
          answerResult: answerResult,
        });
      }
    );
  });
});

app.post(`/quiz/:questionID`, (req, res) => {
  const { questionID } = req.params;
  const nextQuestionID = parseInt(questionID) + 1;
  res.redirect(`/quiz/${nextQuestionID}`);
});

app.get("/theEnd", (req, res) => {
  res.render("quizTheEnd", {
    title: "Quiz Complete",
  });
});

app.listen(4000, () => {
  console.log("Serwer nasłuchuje na porcie 4000...");
});
