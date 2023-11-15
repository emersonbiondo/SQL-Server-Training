USE [ProjectSQL];
GO

CREATE TABLE [UserPass]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[UserId] INT NOT NULL,
		[PasswordHash] BINARY(64) NOT NULL,
		[Salt] NVARCHAR(36) NOT NULL,
		[DateStart] DATETIME NOT NULL,
		[DateStop] DATETIME NULL
	);

ALTER TABLE [UserPass] 
	ADD CONSTRAINT [PK_UserPass] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [UserPass] 
	ADD CONSTRAINT [IU_UserPass] UNIQUE NONCLUSTERED 
	(
		[UserId],
		[DateStart],
		[DateStop]
	);

ALTER TABLE [UserPass]
	ADD CONSTRAINT [FK_UserPass_User] 
	FOREIGN KEY([UserId]) 
	REFERENCES [User]([Id]);