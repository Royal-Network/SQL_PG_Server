CREATE TABLE Post_Nr_By
(
Post_Nr INT PRIMARY KEY,
By_navn VARCHAR(50) NOT NULL,
);

CREATE TABLE Klassen
(
KlasseID INT PRIMARY KEY,
Klassen VARCHAR (45) NOT NULL UNIQUE
);

CREATE TABLE Lærer
(
Lærer_ID INT IDENTITY(1,1),
Fornavn VARCHAR(30) NOT NULL ,
Efternavn VARCHAR (15) NOT NULL ,
Adresse VARCHAR (50) NOT NULL ,
Post_Nr INT,
FOREIGN KEY (Post_Nr) REFERENCES Post_Nr_By(Post_Nr),
FOREIGN key (Lærer_ID) REFERENCES Klassen(KlasseID)
);

CREATE TABLE Klasse
(
lokale_id INT,
Klasse_navn VARCHAR (50) NOT NULL,
);

CREATE TABLE Elever
(
Elev_ID INT IDENTITY(1,1) PRIMARY KEY,
Elev_Fornavn VARCHAR (20) NOT NULL ,
Elev_Efternavn VARCHAR (20) NOT NULL ,
Elev_Adresse VARCHAR (60) NOT NULL ,
Post_Nr INT,
FOREIGN KEY (Elev_ID)REFERENCES Elever(Elev_ID),
FOREIGN KEY (Post_Nr)REFERENCES Post_Nr_By(Post_Nr)
);

INSERT INTO Post_Nr_By(Post_Nr,By_navn)
VALUES 
(2650,'Hvidovre'),
(2300,'København S'),
(2500,'Valby'),
(2610,'Rødovre'),
(3650,'Ølstykke'),
(2830,'Virum'),
(2770,'Kastrup'),
(1824,'Frederiksberg C'),
(2740,'Skovlunde'),
(2750,'Ballerup');

INSERT INTO Klassen(KlasseID,Klassen)
VALUES
(03, 'Nætværk'),
(02, 'Operativ-Systemer'),
(01, 'Datatekniker');

INSERT INTO Lærer(Fornavn,Efternavn,Adresse,Post_Nr)
VALUES 
('Tom','It','Sankt Thomas Alle 3',1824),
('Lars','Henriksen','Nissedalen 76',2740),
('Mia','Hansen','Østervej 16',2750);

INSERT INTO Elever(Elev_Fornavn,Elev_Efternavn,Elev_Adresse,Post_Nr)
VALUES 
('Bo','Andersen','Gammel Byvej 12',2650),
('Frederikke','Hansen','Amager Boulevard 5',2300),
('Jens','Mikkelsen','Lily Brogbergs Vej 17',2500),
('Philip','Mortensen','Brunevang 90',2610),
('Kasper','Frederiksen','Bryggertorvet32',3650),
('Milla','Jørgensen','Virum Torv 25',2830),
('Fie','Knudsen','Allen 85',2770),
('Henrik','Madsen','Lily Brobergs Vej 53',2500);


INSERT INTO Klasse(lokale_id,Klasse_navn)
VALUES
(1,'1A'),
(2,'9B'),
(3,'4D');

SELECT * FROM Post_Nr_By Order BY Post_Nr

SELECT * FROM Klassen
RIGHT JOIN klasse ON Klasse.lokale_id=Klassen.KlasseID;

SELECT * FROM Lærer
lEFT JOIN Post_Nr_By on Lærer.Post_Nr=Post_Nr_By.Post_Nr;

SELECT * FROM Elever
lEFT JOIN Post_Nr_By on Elever.Post_Nr=Post_Nr_By.Post_Nr;

