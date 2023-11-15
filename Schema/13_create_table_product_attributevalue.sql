USE [ProjectSQL];
GO

CREATE TABLE [Product_AttributeValue]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[ProductId] INT NOT NULL,
		[AttributeValueId] INT NOT NULL
	);

ALTER TABLE [Product_AttributeValue] 
	ADD CONSTRAINT [PK_Product_AttributeValue] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [Product_AttributeValue] 
	ADD CONSTRAINT [IU_Product_AttributeValue] UNIQUE NONCLUSTERED 
	(
		[ProductId],
		[AttributeValueId]
	);

ALTER TABLE [Product_AttributeValue]
	ADD CONSTRAINT [FK_Product_AttributeValue_Product] 
	FOREIGN KEY([ProductId]) 
	REFERENCES [Product]([Id]);

ALTER TABLE [Product_AttributeValue]
	ADD CONSTRAINT [FK_Product_AttributeValue_AttributeValue] 
	FOREIGN KEY([AttributeValueId]) 
	REFERENCES [AttributeValue]([Id]);