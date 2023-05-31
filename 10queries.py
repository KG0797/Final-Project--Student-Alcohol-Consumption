Katherine Guo-
9. CREATE TABLE higher_eudcation AS SELECT id, schoolsup, famsup, paid, higher, G3 FROM student_new;
10. CREATE TABLE health_condition AS SELECT age, sex, Dalc, Walc, health FROM student_new;

Katherine Wei
CREATE TABLE failures AS SELECT Dalc, Walc, studytime, failures, COUNT(*) AS count FROM student_new GROUP BY failures;
CREATE TABLE purpose AS SELECT studytime, failures, higher, COUNT(*) AS count FROM student_new GROUP BY studytime, failures, higher;

