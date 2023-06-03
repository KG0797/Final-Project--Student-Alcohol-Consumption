--Yingchen Yang
CREATE TABLE Goout_alcohol (
  id TEXT PRIMARY KEY,
  Dalc TEXT,
  Walc TEXT,
  goout TEXT
);

INSERT INTO Goout_alcohol (id, Dalc, Walc, goout)
SELECT id, Dalc, Walc, goout
FROM student_por;

CREATE TABLE Internet_alcohol (
  id TEXT PRIMARY KEY,
  Dalc TEXT,
  Walc TEXT,
  internet TEXT
);

INSERT INTO Internet_alcohol (id, Dalc, Walc, internet)
SELECT id, Dalc, Walc, internet
FROM student_por;

--Katherine Wei
CREATE TABLE failures AS SELECT Dalc, Walc, studytime, failures, COUNT(*) AS count FROM student_new GROUP BY failures;
CREATE TABLE purpose AS SELECT studytime, failures, higher, COUNT(*) AS count FROM student_new GROUP BY studytime, failures, higher;







--Katherine Guo
CREATE TABLE higher_eudcation AS SELECT id, schoolsup, famsup, paid, higher, G3 FROM student_new;
CREATE TABLE health_condition AS SELECT age, sex, Dalc, Walc, health FROM student_new;


