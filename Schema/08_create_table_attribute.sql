USE [ProjectSQL];
GO

CREATE TABLE [Attribute]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[Name] NVARCHAR(50) NOT NULL
	);

ALTER TABLE [Attribute] 
	ADD CONSTRAINT [PK_Attribute] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [Attribute] 
	ADD CONSTRAINT [IU_Attribute] UNIQUE NONCLUSTERED 
	(
		[Name]
	);