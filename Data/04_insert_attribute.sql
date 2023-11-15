USE [ProjectSQL]
GO

INSERT INTO Attribute
	(
		[Name]
	)
	VALUES
		('Color'),
		('Depth'),
		('Height'),
		('Weight'),
		('Width');

--CHANGE VALUE CHANGE THE VARIABLE TO THE FILE LOCATION
DECLARE @fileAttributeValue AS VARCHAR(MAX) = '..\AttributeValue.csv';

CREATE TABLE [#AttributeValue_TEMP]
	(
		[Attribute] NVARCHAR(50),
		[Name] NVARCHAR(50)
	);

DECLARE @SQL VARCHAR(MAX);

SET @SQL = 'BULK INSERT [#AttributeValue_TEMP] FROM ''' + @fileAttributeValue + ''' WITH
			(
				FIRSTROW = 1,
				FIELDTERMINATOR = '';'',
				ROWTERMINATOR = ''\n''
			)';

EXEC (@SQL);

INSERT INTO [AttributeValue] 
	SELECT 
		[Attribute].[Id],
		[#AttributeValue_TEMP].[Name]
	FROM
		[#AttributeValue_TEMP]
	INNER JOIN 
		[Attribute] ON ([#AttributeValue_TEMP].[Attribute] = [Attribute].[Name] COLLATE SQL_Latin1_General_CP1_CI_AI);

DROP TABLE [#AttributeValue_TEMP];