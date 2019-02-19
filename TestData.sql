---INSERT / UPDATE SECTION-----

INSERT INTO Customers (Name, Address, Email)
VALUES ('Vidoo', '1 Sherman Court', 'llefloch0@furl.net'),
('Skinder', '32 Tony Place', 'phue1@biblegateway.com'),
('Browsetype', '71 Cascade Court', 'mbasset2@typepad.com'),
('Tazz', '7 Sherman Circle', 'naumerle3@buzzfeed.com'),
('Ainyx', '133 Monica Parkway', 'thayselden4@lycos.com'),
('Innojam', '497 Pierstorff Center', 'vcoldbreath5@diigo.com'),
('Plajo', '14 Oak Crossing', 'emaudsley6@123-reg.co.uk'),
('Edgeblab', '23110 Blaine Street', 'bjanak7@domainmarket.com'),
('Babbleopia', '69 Artisan Park', 'sstanbrooke8@123-reg.co.uk'),
('Kaymbo', '6721 Farmco Court', 'scartmer9@nbcnews.com');
go

INSERT INTO Languages (Name, RatePerWord)
VALUES ('Polish', 0.10),
('English', 0.05),
('French', 0.05),
('Greek', 0.05),
('Dutch', 0.10),
('Italian', 0.05),
('German',  0.10),
('Russian', 0.05),
('Chinese', 0.15),
('Swedish', 0.15);
go

INSERT INTO Translators (FirstName, LastName, Address, Email)
VALUES ('Yves', 'Szreter', '4889 Forest Run Terrace', 'yszreter0@tinypic.com'),
('Patience', 'Garahan', '158 Fuller Place', 'pgarahan1@wunderground.com'),
('Zandra', 'Wealthall', '377 Oxford Road', 'zwealthall2@angelfire.com'),
('Trueman', 'Castellanos', '8416 Division Pass', 'tcastellanos3@sourceforge.net'),
('Alexandre', 'Keattch', '8677 Evergreen Avenue', 'akeattch4@amazon.co.jp'),
('Roz', 'Mabbott', '1 Cordelia Road', 'rmabbott5@smh.com.au'),
('Fernande', 'Kadwallider', '6181 Dahle Way', 'fkadwallider6@buzzfeed.com'),
('Ilka', 'Lomasna', '80 Atwood Place', 'ilomasna7@businessweek.com'),
('Georgeanne', 'Kliemchen', '50492 Arkansas Hill', 'gkliemchen8@squarespace.com'),
('Janka', 'Daelman', '0 Susan Street', 'jdaelman9@mozilla.org');
go

INSERT INTO Documents (Title, WordsCount, CustomerID, FileURL, LanguageID, Origin)
VALUES ('The Mule', 6205, 4, null, 6, 1),
('Babe, The', 8429, 8, 'http://dummyimage.com/128x130.png/cc0000/ffffff', 2, 1),
('Making Contact (a.k.a. Joey)', 8124, 5, 'http://dummyimage.com/112x153.png/ff4444/ffffff', 5, 1),
('Picture of Dorian Gray, The', 3609, 7, 'http://dummyimage.com/190x237.jpg/dddddd/000000', 2, 1),
('Sapphires, The', 5326, 6, 'http://dummyimage.com/178x196.png/cc0000/ffffff', 5, 1),
('Sucker Punch', 6766, 2, 'http://dummyimage.com/250x240.bmp/ff4444/ffffff', 7, 1),
('3 Blind Mice', 9081, 7, 'http://dummyimage.com/143x173.png/dddddd/000000', 9, 1),
('Terry Fator: Live from Las Vegas', 7390, 5, 'http://dummyimage.com/111x137.bmp/dddddd/000000', 2, 1),
('Date with an Angel', 3954, 2, 'http://dummyimage.com/160x169.jpg/dddddd/000000', 9, 1),
('Thief of Bagdad, The', 667, 4, 'http://dummyimage.com/111x115.jpg/ff4444/ffffff', 2, 1),
('Marshland (Isla mínima, La)', 1582, 9, 'http://dummyimage.com/249x102.jpg/dddddd/000000', 10, 1),
('Downfall (Untergang, Der)', 4514, 3, 'http://dummyimage.com/220x119.bmp/dddddd/000000', 5, 1),
('Moby Dick', 3996, 2, 'http://dummyimage.com/145x137.bmp/cc0000/ffffff', 6, 1),
('King Kong', 4660, 10, 'http://dummyimage.com/244x121.jpg/dddddd/000000', 4, 1),
('Italian Job, The', 625, 10, 'http://dummyimage.com/213x118.jpg/ff4444/ffffff', 7, 1),
('Watch the Birdie', 4784, 2, 'http://dummyimage.com/217x177.png/ff4444/ffffff', 3, 1),
('Dead Man''s Burden', 4914, 2, 'http://dummyimage.com/196x182.png/cc0000/ffffff', 9, 1),
('Darktown Strutters (Get Down and Boogie)', 7844, 10, 'http://dummyimage.com/143x234.jpg/5fa2dd/ffffff', 2, 1),
('Bakery Girl of Monceau, The (La boulangère de Monceau)', 9800, 5, 'http://dummyimage.com/101x194.jpg/5fa2dd/ffffff', 6, 1),
('Vizontele Tuuba', 4744, 9, 'http://dummyimage.com/200x212.jpg/cc0000/ffffff', 4, 1),
('Target', 4888, 2, 'http://dummyimage.com/116x135.png/cc0000/ffffff', 6, 1),
('Cool Air', 9645, 4, null, 2, 1),
('Presidentintekijät', 3666, 8, null, 9, 1),
('Night Will Fall', 9107, 8, 'http://dummyimage.com/107x234.png/dddddd/000000', 4, 1),
('Year and a Half in the Life of Metallica, A', 8275, 5, 'http://dummyimage.com/150x108.bmp/5fa2dd/ffffff', 9, 1),
('Mummy''s Hand, The', 8844, 2, null, 2, 1),
('Waking Sleeping Beauty', 9137, 9, 'http://dummyimage.com/126x163.jpg/ff4444/ffffff', 6, 1),
('Hunchback of Notre Dame, The', 1654, 9, 'http://dummyimage.com/166x112.bmp/ff4444/ffffff', 9, 1),
('Hear My Song', 6611, 3, null, 1, 1),
('Macheads', 7382, 8, 'http://dummyimage.com/235x141.jpg/5fa2dd/ffffff', 10, 1);
go

INSERT INTO Translators_Languages (TranslatorID, LanguageID)
VALUES (1, 4),(4, 5),(4, 10),(2, 2),(2, 3),(2, 10),(8, 7),(5, 5),(6, 4),(5, 2),(4, 9),(6, 2),(10, 1),(8, 2),(7, 7),(7, 3),(8, 8),
(8, 10),(5, 4),(9, 7),(3, 10),(6, 10),(4, 4),(2, 9),(3, 6),(4, 6),(10, 5),(4, 3),(9, 8),(9, 9),(5, 7),(10, 8),(5, 10),(2, 4),
(8, 6),(2, 1),(3, 8),(3, 7),(8, 3),(3, 3),(7, 5),(1, 7),(3, 9),(6, 3),(7, 1),(1, 5),(4, 8),(8, 4),(2, 5),(4, 2),(7, 9),(8, 1),(10, 9),
(2, 6),(5, 1),(7, 2);
go

INSERT INTO Orders (DocumentID, LanguageID) VALUES (6, 10);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (1, 2);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (2, 9);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (6, 1);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (10, 8);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (5, 1);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (2, 4);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (8, 2);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (3, 8);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (7, 4);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (3, 9);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (1, 7);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (1, 4);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (3, 10);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (9, 5);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (7, 8);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (9, 3);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (7, 1);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (7, 7);
INSERT INTO Orders (DocumentID, LanguageID) VALUES (6, 3);
go


INSERT INTO Orders_Translators (OrderID, TranslatorID)
VALUES (1, 4),(4, 5),(4, 10),(2, 2),(2, 3),(2, 10),(8, 7),(5, 5),(6, 4),(5, 2),(4, 9),(6, 2),(10, 1),(8, 2),(7, 7),(7, 3),(8, 8),
(8, 10),(5, 4),(9, 7),(3, 10),(6, 10),(4, 4),(2, 9),(3, 6),(4, 6),(10, 5),(4, 3),(9, 8),(9, 9),(5, 7),(10, 8),(5, 10),(2, 4),
(8, 6),(2, 1),(3, 8),(3, 7),(8, 3),(3, 3),(7, 5),(1, 7),(3, 9),(6, 3),(7, 1),(1, 5),(4, 8),(8, 4),(2, 5),(4, 2),(7, 9),(8, 1),(10, 9),
(2, 6),(5, 1),(7, 2);
go

UPDATE Orders SET Finished = 1, EndDate = DATEADD(day, (ABS(CHECKSUM(NEWID()) % 20)+1), GETDATE()) WHERE Finished = 0 AND OrderID <= 12;
go

UPDATE OT 
SET ReviewRate = (ABS(CHECKSUM(NEWID()) % 5)+1), 
TranslatedPercentage = (
    100/(SELECT COUNT(OT.TranslatorID) FROM Orders_Translators OT WHERE OT.OrderID = O.OrderID)
)
FROM Orders_Translators AS OT
INNER JOIN Orders AS O ON O.OrderID = OT.OrderID AND Finished = 1
INNER JOIN Documents AS D ON D.DocumentID = O.DocumentID
WHERE OT.TranslatedPercentage = 0;
go

