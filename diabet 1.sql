-- Analyze first trimester of pregnacy

USE portfoliodiabet;

SELECT Age, Pregnancies, Glucose, Insulin
FROM portfoliodiabet.diabetes
order by 3,4;

SELECT Age, Pregnancies, Glucose, Insulin
FROM portfoliodiabet.diabetes
where Pregnancies between 1 and 3 
order by Pregnancies desc;

-- Pregnancies with PreDiabets
SELECT Age, Pregnancies, Glucose, Insulin
FROM portfoliodiabet.diabetes
where Pregnancies between 1 and 3 and Glucose between 85 and 120
order by Pregnancies desc, Glucose;

-- Pregnancies First Trimester with Highest Glucose
SELECT Age, Pregnancies, Glucose, Insulin
FROM portfoliodiabet.diabetes
where Pregnancies between 1 and 3 and Glucose between 120 and 400
order by Pregnancies desc, Glucose;

-- Pregnancies First Trimester with Diabet
SELECT Age, Pregnancies, Glucose, Insulin
FROM portfoliodiabet.diabetes
WHERE Pregnancies BETWEEN 1 AND 3 AND Glucose BETWEEN 120 AND 400 AND Insulin > 1
ORDER BY Pregnancies desc, Glucose;



-- insert into Table Diabet
ALTER TABLE diabetes
ADD COLUMN Bmi Double AFTER Pregnancies;
DESC diabetes;
show variables like "secure_file_priv";  
show variables like "local_infile";
set global local_infile = 1;
set global secure_file_priv ='';

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE '/Users/orianaleal/Downloads/bmi.csv'
INTO table diabetes
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(@Bmi) set Bmi = @Bmi;



-- Pregnancies First Trimester with highPressure

SELECT dia.pregnancies, dia.glucose, dia.insulin, dia.age, sym.BloodPressure, sym.SkinThickness, sym.DiabetesPedigreeFunction from portfoliodiabet.diabetes dia
JOIN portfoliodiabet.symptoms sym
ON dia.Pregnancies = sym.Pregnancies
and dia.Age = sym.Age
and dia.DiabetesPedigreeFunction = sym.DiabetesPedigreeFunction
where sym.BloodPressure <80;




