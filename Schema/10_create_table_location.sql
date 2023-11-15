USE [ProjectSQL];
GO

CREATE TABLE [Location]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Description] NVARCHAR(200) NULL
	);

ALTER TABLE [Location] 
	ADD CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [Location] 
	ADD CONSTRAINT [IU_Location] UNIQUE NONCLUSTERED 
	(
		[Name]
	);