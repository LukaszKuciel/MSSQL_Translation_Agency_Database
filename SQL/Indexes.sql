-- Create indexes for table Orders

CREATE INDEX [IX_Relationship7] ON [Orders] ([LanguageID])
go

CREATE INDEX [IX_Relationship8] ON [Orders] ([DocumentID])
go

-- Create indexes for table Documents

CREATE INDEX [IX_Relationship1] ON [Documents] ([CustomerID])
go

CREATE INDEX [IX_Relationship2] ON [Documents] ([LanguageID])
go

-- Create indexes for 

CREATE INDEX [IX_Documents_WordsCount] ON [Documents] ([WordsCount] ASC)
go

CREATE INDEX [IX_Languages_RatePerWord] ON [Languages] ([RatePerWord] ASC)
go