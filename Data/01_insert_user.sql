USE [ProjectSQL]
GO

SET IDENTITY_INSERT [User] ON;

INSERT INTO [User]
	(
		[Id],
		[Login],
		[Name],
		[Mail],
		[Key]
	)
	VALUES
		(
			1,
			'root',
			'MASTER USER',
			'root@root.com',
			null
		);

SET IDENTITY_INSERT [User] OFF;

DECLARE @salt UNIQUEIDENTIFIER=NEWID();

INSERT INTO [UserPass]
	(
		[UserId],
		[PasswordHash],
		[Salt],
		[DateStart],
		[DateStop]
	)
	VALUES
		(
			1,
			HASHBYTES('SHA2_512', 'root' + CAST(@salt AS NVARCHAR(36))),
			@salt,
			GETDATE(),
			null
		);