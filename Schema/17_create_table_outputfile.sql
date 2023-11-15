USE [ProjectSQL];
GO

CREATE TABLE [OutputFile]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[OutputProductId] INT NOT NULL,
		[Name] NVARCHAR(50) NOT NULL,
		[Filename] NVARCHAR(200) NOT NULL,
		[File] VARBINARY(MAX) NOT NULL
	);

ALTER TABLE [OutputFile] 
	ADD CONSTRAINT [PK_OutputFile] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [OutputFile] 
	ADD CONSTRAINT [IU_OutputFile] UNIQUE NONCLUSTERED 
	(
		[OutputProductId],
		[Name]
	);

ALTER TABLE [OutputFile]
	ADD CONSTRAINT [FK_OutputFile_OutputProduct] 
	FOREIGN KEY([OutputProductId]) 
	REFERENCES [OutputProduct]([Id]);