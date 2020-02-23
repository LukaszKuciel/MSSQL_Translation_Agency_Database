-- Create triggers for table Orders

-- Check if there is available translator for such translation and calculate price

CREATE TRIGGER [OrderInsertTrigger]
    ON [Orders]
    INSTEAD OF INSERT
    AS
    BEGIN
  SET NOCOUNT ON;

  DECLARE @LanguageID AS Int,
    @DocumentID AS Int,
    @DocumentLanguage AS Int,
    @Proceed AS Int;

  SELECT @LanguageID = LanguageID, @DocumentID = DocumentID
  FROM INSERTED;

  SELECT @DocumentLanguage = LanguageID
  FROM Documents
  WHERE DocumentID = @DocumentID;

  SELECT @Proceed = TranslatorID
  FROM Translators_Languages
  WHERE LanguageID IN ( @LanguageID, @DocumentLanguage )
  GROUP BY TranslatorID
  HAVING COUNT(DISTINCT LanguageID) >= 2;

  IF @Proceed IS NOT NULL
  BEGIN
    INSERT INTO [Orders]
      (
      [LanguageID],
      [DocumentID],
      [StartDate],
      [Price])
    VALUES(
        @LanguageID,
        @DocumentID,
        GETDATE(),
        (
          SELECT (D.WordsCount * L.RatePerWord) AS Price
        FROM Documents AS D
          LEFT JOIN Languages AS L ON L.LanguageID = @LanguageID
        WHERE D.DocumentID = @DocumentID
        )
    )
  END
    ELSE
    PRINT 'No translator found for this kind of translation.';
END
go


-- check if email has valid format and is unique

CREATE OR ALTER TRIGGER tr_TranslatorEmailCheck_InsteadOfInsert
ON Translators
INSTEAD OF INSERT
AS
BEGIN
  DECLARE 
		@Email varchar(320), 
		@FirstName nvarchar(250), 
		@LastName nvarchar(250), 
		@Address nvarchar(250), 
		@Error varchar(250);

  SELECT
    @Email = Email,
    @FirstName = FirstName,
    @LastName = LastName,
    @Address = Address
  FROM INSERTED

  IF (@Email <> '' AND @Email NOT LIKE '_%@__%.__%')
		SET @Error = 'Email format is invalid.'

  IF EXISTS(
		SELECT *
  FROM Translators
  WHERE Email = @Email
	)
	BEGIN
    SET @Error = 'Email already exists.'
  END

  IF @Error IS NULL
	  BEGIN
    INSERT INTO Translators
      (
      FirstName,
      LastName,
      Address,
      Email)
    VALUES(
        @FirstName,
        @LastName,
        @Address,
        @Email
		)
  END
	ELSE
		PRINT @Error;
END