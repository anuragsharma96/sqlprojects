CREATE DATABASE AbleJobs;
USE AbleJobs;
CREATE TABLE Sales1 (Salesman_Id INT Primary Key, Name VARCHAR (100), City VARCHAR (100), Commission NUMERIC(6,2));
INSERT INTO Sales1 ( Salesman_ID, Name, city, Commission) VALUES (5001, 'James Hoog','New York',0.15),
(5002,'Nail Knite', 'Paris',0.13),
(5005, 'Pit Alex','London',0.11),
(5006, 'Mc Lyon','Paris',0.14),
(5007, 'Paul Adam','Rome',0.13),
(5003, 'Lauson Hen','San Jose',012);
SELECT * FROM Sales1;
UPDATE Sales1 SET Commission=0.12 WHERE Salesman_Id=5003;
SELECT * FROM Sales1;