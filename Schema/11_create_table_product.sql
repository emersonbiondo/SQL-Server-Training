USE [ProjectSQL];
GO

CREATE TABLE [Product]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[LocationId] INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Description] NVARCHAR(200) NULL
	);

ALTER TABLE [Product] 
	ADD CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [Product] 
	ADD CONSTRAINT [IU_Product] UNIQUE NONCLUSTERED 
	(
		[LocationId],
		[Name]		
	);

ALTER TABLE [Product]
	ADD CONSTRAINT [FK_Product_Location] 
	FOREIGN KEY([LocationId]) 
	REFERENCES [Product]([Id]);