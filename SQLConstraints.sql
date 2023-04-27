CREATE DATABASE CompanyTask

USE CompanyTask

CREATE TABLE Employees
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(25) NOT NULL,
	SurName NVARCHAR(25) NOT NULL,	
	Salary MONEY CHECK(Salary>=250) NOT NULL,
	Email NVARCHAR(50) UNIQUE NOT NULL
)

INSERT INTO Employees(Name,Surname,Salary,Email)
VALUES
('Samed','Musayev',700,'samad@mail.ru'),
('Umid','Museyibli',900,'umid@gmail.com'),
('Intigam','Quluzade',300,'intigam@gmail.com'),
('Nicat','Rehimov',500,'nicat@gmail.com'),
('Nemet','Abdullayev',1700,'nemat@mail.ru')

SELECT * FROM Employees
WHERE Salary BETWEEN 500 AND 1000

SELECT Id,CONCAT(Name,' ',Surname) AS 'FullName',Email FROM Employees
WHERE LEN(CONCAT(Name,' ',Surname)) > 9

SELECT Id,CONCAT(Name,' ',Surname) AS 'FullName',Email FROM Employees
WHERE Salary> (SELECT AVG(Salary) FROM Employees)

UPDATE Employees
SET Salary = (SELECT AVG(Salary) FROM Employees)
WHERE Salary < (SELECT AVG(Salary) FROM Employees)

SELECT DISTINCT RIGHT(Email, CHARINDEX('@', REVERSE(Email))-1) AS 'DomainExtension' FROM employees;

SELECT 
    COUNT(Id) AS 'Count',
    COUNT(Id) * 100.0 / (SELECT COUNT(Id) FROM Employees) AS 'Percentage' FROM employees
WHERE salary > 1000;