-- Create language price chart view with number of translators, translated documents and avg rate

CREATE OR ALTER VIEW PriceChart
AS
  SELECT
    L.Name,
    L.RatePerWord,
    COUNT(DISTINCT TL.TranslatorID) AS 'Translators',
    COUNT(DISTINCT O.OrderID) AS 'Already translated docs',
    AVG(DISTINCT OT.ReviewRate) AS 'Average rate'
  FROM Languages L
    LEFT JOIN Translators_Languages TL ON TL.LanguageID = L.LanguageID
    LEFT JOIN Orders O ON O.LanguageID = L.LanguageID AND O.Finished = 1
    LEFT JOIN Orders_Translators OT ON O.OrderID = OT.OrderID
  GROUP BY L.Name, L.RatePerWord
  ORDER BY L.Name
GO

-- Create view with pending orders

CREATE OR ALTER VIEW PendingOrders
AS
  SELECT D.Title, D.WordsCount, L.Name, O.StartDate, O.Price
  FROM Orders O
    LEFT JOIN Languages L ON L.LanguageID = O.LanguageID
    LEFT JOIN Documents D ON D.DocumentID = O.DocumentID
  WHERE Finished = 0
GO