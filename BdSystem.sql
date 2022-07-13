USE System 
Drop table USERS
CREATE TABLE CARDS
(
	CardId INT IDENTITY NOT NULL PRIMARY KEY,
	TypeCard bit
)

CREATE TABLE USERS
(
	UserId INT IDENTITY NOT NULL PRIMARY KEY,
	NameUs Varchar(20),
	Jobtitle Varchar(20)
)

SELECT * FROM USERS

INSERT INTO USERS (NameUs, Jobtitle) VALUES
('Mihail Pavlov','director'),
('Lidiya Viktorovna','director'),
('Ivan Petrov', 'accounter'),
('Pavel Petrov','laywer'),
('Maria Golubeva','manager'),
('Olga Melnikova','accounter'),
('Victor Nikolaevich','hr'),
('Katerina Petrova','laywer')

CREATE TABLE CARDS
(
	CardId INT IDENTITY NOT NULL PRIMARY KEY,
	TypeCard bit,
	UserId INT NOT NULL FOREIGN KEY REFERENCES USERS(UserId)
)

SELECT * FROM USERS

INSERT INTO CARDS (TypeCard, UserId) VALUES 
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8)

SELECT * FROM CARDS

DROP TABLE PROFILE

CREATE TABLE ORGANIZATION
(
	OrgId INT IDENTITY NOT NULL PRIMARY KEY,
	location Varchar(20),
	UserId INT NOT NULL FOREIGN KEY REFERENCES USERS(UserId)
)

INSERT INTO ORGANIZATION (location, UserId) VALUES 
('Moscow',2),
('Moscow',3),
('Moscow',5),
('Moscow',7),
('Moscow',8),
('Alyaska',1),
('Yekaterinburg',4),
('Yekaterinburg',6)

SELECT * FROM PROFILE

CREATE TABLE PROFILE
(
	ProfileId INT IDENTITY NOT NULL PRIMARY KEY,
	UserId INT NOT NULL FOREIGN KEY REFERENCES USERS(UserId),
	Age INT NOT NULL,
	Timetable Varchar(20)
)

INSERT INTO  PROFILE(UserId, Age, Timetable) VALUES
(1,45, '12-14'),
(2,39, '11-13'),
(3,30,'9-18'),
(4,21,'9-18'),
(5,23,'9-18'),
(6,50,'9-18'),
(7,33,'9-18'),
(8,28,'9-18')

SELECT * FROM TERMINAL

DROP TABLE TERMINAL

CREATE TABLE TERMINAL
(
	TerminalId INT IDENTITY NOT NULL PRIMARY KEY,
	Belongs bit,
	UserId INT NOT NULL FOREIGN KEY REFERENCES USERS(UserId)
)

INSERT INTO  TERMINAL(Belongs, UserId) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8)

SELECT * FROM CARDS
SELECT NameUs from USERS WHERE Jobtitle = 'director'
SELECT TypeCard from CARDS Where UserId = 1 OR UserId =2
SELECT * FROM ORGANIZATION Order by location DESC
SELECT location, UserId FROM ORGANIZATION GROUP BY UserId,location
SELECT AVG(Age) as avgage from PROFILE
SELECT Jobtitle as directorss from USERS WHERE Jobtitle = 'director'
SELECT * from PROFILE WHERE Timetable LIKE '9%'
SELECT NameUs, Jobtitle,Age, Timetable From USERS JOIN PROFILE on USERS.UserId = PROFILE.UserId