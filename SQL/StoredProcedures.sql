-- Get translators for given language sorted by review rate

CREATE OR ALTER PROCEDURE TranslatorsForLanguage
  @LangugageID int
AS
BEGIN
  SELECT
    T.TranslatorID,
    CONCAT(T.FirstName, ' ',T.LastName) AS Translator,
    AVG(OT.ReviewRate) AS 'Average rate',
    COUNT(OT.OrderID) AS 'Number of translations'
  FROM Orders O
    INNER JOIN Orders_Translators OT ON OT.OrderID = O.OrderID
    INNER JOIN Translators T ON T.TranslatorID = OT.TranslatorID
  WHERE O.LanguageID = @LangugageID
  GROUP BY T.TranslatorID, T.FirstName, T.LastName
  ORDER BY 'Average rate' DESC
END
GO

-- Get summary for translator with given ID

CREATE OR ALTER PROCEDURE TranslatorSummary
  @TranslatorID int
AS
BEGIN
  SELECT DISTINCT
    T.TranslatorID,
    CONCAT(T.FirstName, ' ',T.LastName) AS Translator,
    COUNT(DISTINCT TL.LanguageID) AS 'Languages',
    COUNT(DISTINCT O.OrderID) AS 'Translated Documents',
    SUM(DISTINCT (D.WordsCount * OT.TranslatedPercentage) / 100) AS 'Translated Words',
    AVG(DISTINCT OT.ReviewRate) AS 'Average rate',
    SUM(DISTINCT (O.Price * OT.TranslatedPercentage) / 100) AS 'Total Income',
    AVG(DISTINCT (O.Price * OT.TranslatedPercentage) / 100) AS 'Average Income Per Document',
    AVG(DISTINCT ((O.Price/D.WordsCount) * OT.TranslatedPercentage) / 100) AS 'Average Income Per Word',
    AVG(DISTINCT DATEDIFF(DAY, O.StartDate, O.EndDate)) AS 'Average Realisation Time (In days)'
  FROM Translators T
    INNER JOIN Translators_Languages TL ON TL.TranslatorID = T.TranslatorID
    INNER JOIN Orders_Translators OT ON OT.TranslatorID = T.TranslatorID
    INNER JOIN Orders O ON O.OrderID = OT.OrderID
    INNER JOIN Documents D ON D.DocumentID = O.DocumentID
  WHERE T.TranslatorID = @TranslatorID
  GROUP BY T.TranslatorID, T.FirstName, T.LastName
END
GO