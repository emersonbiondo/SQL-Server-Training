USE [ProjectSQL];
GO

CREATE TABLE [OutputProduct]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[UserId] INT NOT NULL,
		[ProductId] INT NOT NULL,
		[ProductPriceId] INT NOT NULL,
		[Date] DATETIME NOT NULL,
		[Price] DECIMAL(10, 2) NOT NULL
	);

ALTER TABLE [OutputProduct] 
	ADD CONSTRAINT [PK_OutputProduct] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [OutputProduct]
	ADD CONSTRAINT [FK_OutputProduct_User] 
	FOREIGN KEY([UserId]) 
	REFERENCES [User]([Id]);

ALTER TABLE [OutputProduct]
	ADD CONSTRAINT [FK_OutputProduct_Product] 
	FOREIGN KEY([ProductId]) 
	REFERENCES [Product]([Id]);

ALTER TABLE [OutputProduct]
	ADD CONSTRAINT [FK_OutputProduct_ProductPrice] 
	FOREIGN KEY([ProductPriceId]) 
	REFERENCES [ProductPrice]([Id]);

CREATE NONCLUSTERED INDEX [IX_OutputProduct_Date] ON [OutputProduct]
	(
		[Date]
	);