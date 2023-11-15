USE [ProjectSQL];
GO

CREATE TABLE [ProductGroup_AttributeValue]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[ProductGroupId] INT NOT NULL,
		[AttributeValueId] INT NOT NULL
	);

ALTER TABLE [ProductGroup_AttributeValue] 
	ADD CONSTRAINT [PK_ProductGroup_AttributeValue] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [ProductGroup_AttributeValue] 
	ADD CONSTRAINT [IU_ProductGroup_AttributeValue] UNIQUE NONCLUSTERED 
	(
		[ProductGroupId],
		[AttributeValueId]
	);

ALTER TABLE [ProductGroup_AttributeValue]
	ADD CONSTRAINT [FK_ProductGroup_AttributeValue_ProductGroup] 
	FOREIGN KEY([ProductGroupId]) 
	REFERENCES [ProductGroup]([Id]);

ALTER TABLE [ProductGroup_AttributeValue]
	ADD CONSTRAINT [FK_ProductGroup_AttributeValue_AttributeValue] 
	FOREIGN KEY([AttributeValueId]) 
	REFERENCES [AttributeValue]([Id]);