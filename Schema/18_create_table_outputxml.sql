USE [ProjectSQL];
GO

CREATE TABLE [OutputXml]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[OutputProductId] INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Filename] NVARCHAR(200) NOT NULL,
		[File] XML NOT NULL
	);

ALTER TABLE [OutputXml] 
	ADD CONSTRAINT [PK_OutputXml] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [OutputXml] 
	ADD CONSTRAINT [IU_OutputXml] UNIQUE NONCLUSTERED 
	(
		[OutputProductId],
		[Name]
	);

ALTER TABLE [OutputXml]
	ADD CONSTRAINT [FK_OutputXml_OutputProduct] 
	FOREIGN KEY([OutputProductId]) 
	REFERENCES [OutputProduct]([Id]);