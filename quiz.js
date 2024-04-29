const express = require("express");
const bodyParser = require("body-parser");
const db = require("./connect.js");

const app = express();

app.set("view engine", "jade");
app.use("/assets", express.static("public"));
app.use(bodyParser.urlencoded({ extended: true }));

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

let userAnswer = {};

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
  const answerKey = `answer_${questionID}`;
  const answerId = req.body[answerKey];

  db.query("SELECT * FROM question", (error, questionResult) => {
    if (error) {
      res.status(500).send("Wystąpił błąd przy pobieraniu danych z bazy.");
      return;
    }

    const activeQuestion = questionResult[parseInt(questionID)];

    db.query(
      "SELECT correct_answer_id FROM question WHERE id = ?",
      [activeQuestion.id],
      (error, correctAnswerResult) => {
        if (error) {
          res.status(500).send("Wystąpił błąd przy pobieraniu danych z bazy.");
          return;
        }

        const correctAnswerId = correctAnswerResult[0].correct_answer_id;

        console.log("Answer from user:", answerId);
        console.log("Correct answer ID:", correctAnswerId);

        if (answerId && answerId.startsWith(`${correctAnswerId}_`)) {
          userAnswer[activeQuestion.id] = true;
        } else {
          userAnswer[activeQuestion.id] = false;
        }

        res.redirect(`/quiz/${parseInt(questionID) + 1}`);
      }
    );
  });
});

app.get("/theEnd", (req, res) => {
  db.query("SELECT * FROM question", (error, questionResult) => {
    if (error) {
      console.log("Błąd z odczytem pytań: ", error);
      res.status(404).send("Wystąpił problem podczas odczytu pytań");
      return;
    }

    let correctAnswersCount = 0;

    questionResult.forEach((question) => {
      const questionIDs = question.id;
      if (userAnswer[questionIDs] === true) {
        correctAnswersCount++;
      }
    });

    res.render("quizTheEnd", {
      title: "Quiz Complete",
      Score: `Your score: ${correctAnswersCount}`,
    });
  });
});

app.listen(4000, () => {
  console.log("Serwer nasłuchuje na porcie 4000...");
});
