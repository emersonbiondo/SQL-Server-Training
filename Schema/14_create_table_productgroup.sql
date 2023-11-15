USE [ProjectSQL];
GO

CREATE TABLE [ProductGroup]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Description] NVARCHAR(200) NULL
	);

ALTER TABLE [ProductGroup] 
	ADD CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [ProductGroup] 
	ADD CONSTRAINT [IU_ProductGroup] UNIQUE NONCLUSTERED 
	(
		[Name]
	);