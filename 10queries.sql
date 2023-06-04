CREATE TABLE student_new (
    id INTEGER PRIMARY KEY,
    school TEXT,
    sex TEXT,
    age TEXT,
    address TEXT,
    famsize TEXT,
    Pstatus TEXT,
    Medu TEXT,
    Fedu TEXT,
    Mjob TEXT,
    Fjob TEXT,
    reason TEXT,
    guardian TEXT,
    traveltime TEXT,
    studytime TEXT,
    failures TEXT,
    schoolsup TEXT,
    famsup TEXT,
    paid TEXT,
    activities TEXT,
    nursery TEXT,
    higher TEXT,
    internet TEXT,
    romantic TEXT,
    famrel TEXT,
    freetime TEXT,
    goout TEXT,
    Dalc TEXT,
    Walc TEXT,
    health TEXT,
    absences TEXT,
    G1 TEXT,
    G2 TEXT,
    G3 TEXT);

--Yingchen Yang
--Will the frequency of going out with friends affect alcohol consumption
CREATE TABLE Goout_alcohol (
  id TEXT PRIMARY KEY,
  Dalc TEXT,
  Walc TEXT,
  goout TEXT
);
INSERT INTO Goout_alcohol (id, Dalc, Walc, goout)
SELECT id, Dalc, Walc, goout
FROM student_new;

--Will internet affect the consumption of alcohol
CREATE TABLE Internet_alcohol (
  id TEXT PRIMARY KEY,
  Dalc TEXT,
  Walc TEXT,
  internet TEXT
);
INSERT INTO Internet_alcohol (id, Dalc, Walc, internet)
SELECT id, Dalc, Walc, internet
FROM student_new;

--Katherine Wei
--How daily and weekend alcohol consumption affect a students’ student time and how it reflect the number of past classes failure 
CREATE TABLE failures AS SELECT Dalc, Walc, studytime, failures, COUNT(*) AS count FROM student_new GROUP BY failures;
--How does alcohol consumption affect students’ performance in school and studying, giving more enthusiasm or not?
CREATE TABLE purpose AS SELECT studytime, failures, higher, COUNT(*) AS count FROM student_new GROUP BY studytime, failures, higher;

--Ziyu Lin
--If family living condition have relationship with alcohol consumption
--Why choose this school
INSERT INTO student_new SELECT * FROM student_por;
CREATE TABLE schoolreason AS SELECT school, sex, reason, COUNT(*) as count
FROM student_new GROUP BY school, sex, reason;
CREATE TABLE familyliving_temp AS Select DISTINCT id, school, sex, age, 
address, famsize, Pstatus, Famrel, Dalc, Walc From student_new;
CREATE TABLE familyliving AS SELECT *FROM familyliving_temp ORDER BY Dalc DESC, Walc DESC;

-- Bonnie Chen
-- How does alcohol consumption affect students’ Math or Portuguese grade over time
CREATE TABLE Grade
AS SELECT Dalc, Walc, AVG(G1) AS Average_Grade_G1, AVG(G2) AS Average_Grade_G2, AVG(G3) AS Average_Grade_G3
FROM student_new
GROUP BY Dalc, Walc
ORDER BY Dalc, Walc;
-- How does mom's jobs and guardian related to alcohol consumption?
CREATE TABLE MomJob
AS SELECT Mjob, guardian, AVG(Dalc) AS Average_Daily_Alcohol, AVG(Walc) AS Average_Weekly_Alcohol
FROM student_new
GROUP BY Mjob, guardian
ORDER BY Mjob, guardian;
-- How does dad's jobs and guardian related to alcohol consumption?
CREATE TABLE DadJob
AS SELECT Fjob, guardian, AVG(Dalc) AS Average_Daily_Alcohol, AVG(Walc) AS Average_Weekly_Alcohol
FROM student_new
GROUP BY Fjob, guardian
ORDER BY Fjob, guardian;

--Katherine Guo
--Higher grade means they like to take higher education
CREATE TABLE higher_eudcation AS SELECT id, schoolsup, famsup, paid, higher, G3 FROM student_new;
--Health condition for different age and sex students of alcohol consumption
CREATE TABLE health_condition AS SELECT age, sex, Dalc, Walc, health FROM student_new;
