USE master;
go
IF DB_ID (N'TranslationsAppDatabase') IS NOT NULL
DROP DATABASE TranslationsAppDatabase;

CREATE DATABASE TranslationsAppDatabase;
go

USE TranslationsAppDatabase;

-- Create tables section -------------------------------------------------

-- Table Customers

CREATE TABLE [Customers]
(
    [CustomerID] Int IDENTITY(1,1) NOT NULL,
    [Name] Nvarchar(150) NOT NULL,
    [Address] Nvarchar(250) NOT NULL,
    [Email] Varchar(320) NOT NULL
)
go

-- Add keys for table Customers

ALTER TABLE [Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY ([CustomerID])
go

-- Table Translators

CREATE TABLE [Translators]
(
    [TranslatorID] Int IDENTITY(1,1) NOT NULL,
    [FirstName] Nvarchar(250) NOT NULL,
    [LastName] Nvarchar(250) NOT NULL,
    [Address] Nvarchar(250) NULL,
    [Email] Varchar(320) NOT NULL
)
go

-- Add keys for table Translators

ALTER TABLE [Translators] ADD CONSTRAINT [PK_Translators] PRIMARY KEY ([TranslatorID])
go

-- Table Documents

CREATE TABLE [Documents]
(
    [DocumentID] Int IDENTITY(1,1) NOT NULL,
    [Title] Nvarchar(250) NOT NULL,
    [WordsCount] Int NOT NULL,
    [CustomerID] Int NOT NULL,
    [FileURL] Varchar(250) NULL,
    [LanguageID] Int NOT NULL,
    [Origin] Char(1) DEFAULT 1 NOT NULL
)
go

-- Create indexes for table Documents

CREATE INDEX [IX_Relationship1] ON [Documents] ([CustomerID])
go

CREATE INDEX [IX_Relationship2] ON [Documents] ([LanguageID])
go

-- Add keys for table Documents

ALTER TABLE [Documents] ADD CONSTRAINT [PK_Documents] PRIMARY KEY ([DocumentID])
go

-- Table Languages

CREATE TABLE [Languages]
(
    [LanguageID] Int IDENTITY(1,1) NOT NULL,
    [Name] Varchar(150) NOT NULL,
    [RatePerWord] Float DEFAULT 0 NOT NULL
)
go

-- Add keys for table Languages

ALTER TABLE [Languages] ADD CONSTRAINT [PK_Languages] PRIMARY KEY ([LanguageID])
go

-- Table Translators_Languages

CREATE TABLE [Translators_Languages]
(
    [TranslatorID] Int NOT NULL,
    [LanguageID] Int NOT NULL
)
go

-- Add keys for table Translators_Languages

ALTER TABLE [Translators_Languages] ADD CONSTRAINT [PK_Translators_Languages] PRIMARY KEY ([LanguageID],[TranslatorID])
go

-- Table Orders

CREATE TABLE [Orders]
(
    [OrderID] Int IDENTITY(1,1) NOT NULL,
    [DocumentID] Int NOT NULL,
    [LanguageID] Int NOT NULL,
    [Finished] Char(1) DEFAULT 0 NOT NULL,
    [StartDate] Datetime NOT NULL,
    [EndDate] Datetime NULL,
    [Price] Float DEFAULT 0 NOT NULL,
    CONSTRAINT [OrderDatesCheck] CHECK (StartDate < EndDate)
)
go

-- Create indexes for table Orders

CREATE INDEX [IX_Relationship7] ON [Orders] ([LanguageID])
go

CREATE INDEX [IX_Relationship8] ON [Orders] ([DocumentID])
go

-- Add keys for table Orders

ALTER TABLE [Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY ([OrderID])
go

-- Create triggers for table Orders

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
            INSERT INTO [Orders](
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

-- Table Orders_Translators

CREATE TABLE [Orders_Translators]
(
    [OrderID] Int NOT NULL,
    [TranslatorID] Int NOT NULL,
    [TranslatedPercentage] Int DEFAULT 0 NOT NULL,
    [ReviewRate] Int NULL,
    [ReviewComment] Nvarchar(250) NULL,
    CONSTRAINT [ReviewRateValue] CHECK (ReviewRate >= 1 AND ReviewRate <=5)
)
go

-- Add keys for table Orders_Translators

ALTER TABLE [Orders_Translators] ADD CONSTRAINT [PK_Orders_Translators] PRIMARY KEY ([OrderID],[TranslatorID])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Documents] ADD CONSTRAINT [Customer has many documents] 
FOREIGN KEY ([CustomerID]) REFERENCES [Customers] ([CustomerID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Documents] ADD CONSTRAINT [Documents has various languages] 
FOREIGN KEY ([LanguageID]) REFERENCES [Languages] ([LanguageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Translators_Languages] ADD CONSTRAINT [Language is known by many translators] 
FOREIGN KEY ([LanguageID]) REFERENCES [Languages] ([LanguageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Translators_Languages] ADD CONSTRAINT [Translator knows many languages] 
FOREIGN KEY ([TranslatorID]) REFERENCES [Translators] ([TranslatorID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Orders_Translators] ADD CONSTRAINT [Order has many translators assigned] 
FOREIGN KEY ([OrderID]) REFERENCES [Orders] ([OrderID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Orders_Translators] ADD CONSTRAINT [Translator is assigned to many orders] 
FOREIGN KEY ([TranslatorID]) REFERENCES [Translators] ([TranslatorID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Orders] ADD CONSTRAINT [Language is a target for many orders] 
FOREIGN KEY ([LanguageID]) REFERENCES [Languages] ([LanguageID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Orders] ADD CONSTRAINT [Document has many translation orders] 
FOREIGN KEY ([DocumentID]) REFERENCES [Documents] ([DocumentID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

