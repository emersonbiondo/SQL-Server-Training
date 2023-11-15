USE [ProjectSQL];
GO

CREATE TABLE [AttributeValue]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[AttributeId] INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL
	);

ALTER TABLE [AttributeValue] 
	ADD CONSTRAINT [PK_AttributeValue] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [AttributeValue] 
	ADD CONSTRAINT [IU_AttributeValue] UNIQUE NONCLUSTERED 
	(
		[AttributeId],
		[Name]		
	);

ALTER TABLE [AttributeValue]
	ADD CONSTRAINT [FK_AttributeValue_Attribute] 
	FOREIGN KEY([AttributeId]) 
	REFERENCES [Attribute]([Id]);