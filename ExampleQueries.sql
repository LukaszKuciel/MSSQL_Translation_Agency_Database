---SELECT SECTION-----

--Get List of translators (with price) that can translate document with id = 9 to English
--(Translator needs to know both original and target language)
SELECT D.Title, L2.Name AS 'Original language', T.FirstName, T.LastName, (D.WordsCount * L.RatePerWord) AS 'Translation Price'
FROM Translators_Languages AS TL
INNER JOIN Languages AS L ON L.Name LIKE 'English'
INNER JOIN Documents AS D ON D.DocumentID = 9
INNER JOIN Languages AS L2 ON L2.LanguageID = D.LanguageID
INNER JOIN Translators AS T ON T.TranslatorID = TL.TranslatorID
WHERE TL.LanguageID IN ( D.LanguageID, L.LanguageID )
GROUP BY L2.Name, D.Title, T.FirstName, T.LastName, D.WordsCount, L.RatePerWord
HAVING COUNT(DISTINCT TL.LanguageID) >= 2;
go

--Get List of Languages with number of orders, average translation time and total income for each language.
SELECT L.Name as Language, 
COUNT(O.OrderID) AS 'Number of orders', 
avg(datediff(day, O.StartDate, O.EndDate)) AS 'Average translation time (days)', 
SUM(O.Price) AS 'Total Income (USD)'
FROM Languages AS L
LEFT JOIN Orders AS O ON O.LanguageID = L.LanguageID AND O.Finished = 1
GROUP BY L.Name
ORDER BY 'Total Income (USD)' DESC;
go


--Get List of Translators with number of translated orders 
SELECT CONCAT(T.FirstName, ' ',T.LastName) AS Translator, 
AVG(OT.ReviewRate) AS 'Average rate', 
COUNT(OT.OrderID) AS 'Number of translations'
FROM Translators AS T
INNER JOIN Orders_Translators AS OT ON T.TranslatorID = OT.TranslatorID AND OT.ReviewRate <> 0
GROUP BY T.FirstName, T.LastName
ORDER BY 'Average rate' DESC;
go

--Get List of documents already translated for Client with id = 5
SELECT C.Name as 'Client name', 
D.Title as 'Document title', 
D.WordsCount as 'Number of words', 
L1.Name AS 'Original language', 
L2.Name AS 'Translation language',
O.Price AS 'Price (USD)'
FROM Customers AS C
INNER JOIN Documents AS D ON C.CustomerID = D.CustomerID
INNER JOIN Orders AS O ON O.DocumentID = D.DocumentID
INNER JOIN Languages AS L1 ON L1.LanguageID = D.LanguageID
INNER JOIN Languages AS L2 ON L2.LanguageID = O.LanguageID
WHERE C.CustomerID = 5;
go

--Get List of documents that are currently translated
SELECT C.Name as 'Client name', 
D.Title as 'Document title', 
D.WordsCount as 'Number of words', 
L1.Name AS 'Original language', 
L2.Name AS 'Translation language',
O.Price AS 'Price (USD)'
FROM Customers AS C
INNER JOIN Documents AS D ON C.CustomerID = D.CustomerID
INNER JOIN Orders AS O ON O.DocumentID = D.DocumentID
INNER JOIN Languages AS L1 ON L1.LanguageID = D.LanguageID
INNER JOIN Languages AS L2 ON L2.LanguageID = O.LanguageID
WHERE O.Finished = 0;
go

--Get List of languages with number of translators that know that language, order by most expensive
SELECT L.*, COUNT(T.TranslatorID) AS 'Number of translators'
FROM Languages AS L
INNER JOIN Translators_Languages AS TL ON TL.LanguageID = L.LanguageID
INNER JOIN Translators AS T ON T.TranslatorID = TL.TranslatorID
GROUP BY L.LanguageID, L.Name, L.RatePerWord
ORDER BY RatePerWord DESC;
go

--Get list of documents order by number of words descending
SELECT D.DocumentID, C.Name AS 'Customer', D.Title, D.WordsCount, L.Name AS 'Original language'
FROM Documents AS D
INNER JOIN Languages AS L ON L.LanguageID = D.LanguageID
INNER JOIN Customers AS C ON C.CustomerID = D.CustomerID
GROUP BY D.DocumentID, D.Title, D.WordsCount, L.Name, C.Name
ORDER BY D.WordsCount DESC;
go