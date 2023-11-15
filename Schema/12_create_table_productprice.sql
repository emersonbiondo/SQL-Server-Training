USE [ProjectSQL];
GO

CREATE TABLE [ProductPrice]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[ProductId] INT NOT NULL,
		[Price] DECIMAL(10, 2) NOT NULL,
		[DateStart] DATETIME NOT NULL,
		[DateStop] DATETIME NULL
	);

ALTER TABLE [ProductPrice] 
	ADD CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [ProductPrice] 
	ADD CONSTRAINT [IU_ProductPrice] UNIQUE NONCLUSTERED 
	(
		[ProductId],
		[DateStart],
		[DateStop]
	);

ALTER TABLE [ProductPrice]
	ADD CONSTRAINT [FK_ProductPrice_Product] 
	FOREIGN KEY([ProductId]) 
	REFERENCES [Product]([Id]);

CREATE NONCLUSTERED INDEX [IX_ProductPrice_Price] ON [ProductPrice]
	(
		[Price]
	);