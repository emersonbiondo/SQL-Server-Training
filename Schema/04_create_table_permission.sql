USE [ProjectSQL];
GO

CREATE TABLE [Permission]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Description] NVARCHAR(200) NULL,
		[Key] NVARCHAR(50) NOT NULL,
	);

ALTER TABLE [Permission] 
	ADD CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [Permission] 
	ADD CONSTRAINT [IU_Permission_Name] UNIQUE NONCLUSTERED 
	(
		[Name]
	);

ALTER TABLE [Permission] 
	ADD CONSTRAINT [IU_Permission_Key] UNIQUE NONCLUSTERED 
	(
		[Key]
	);