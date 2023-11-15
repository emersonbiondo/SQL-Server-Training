USE [ProjectSQL]
GO

SET IDENTITY_INSERT [UserGroup] ON;

INSERT INTO [UserGroup]
	(
		[Id],
		[Name],
		[Description]
	)
	VALUES
		(1,'Master','Group Master'),
		(2,'Default','Group Default'),
		(3,'Anonymous','Group for access anonymous');

SET IDENTITY_INSERT [UserGroup] OFF;

INSERT INTO [UserGroup_User]
		SELECT 
			1, 
			[Id] 
		FROM
			[User]
		WHERE
			[Login] like 'root';

INSERT INTO [UserGroupPermission]
		SELECT 
			1, 
			[Id],
			1,
			1,
			1
		FROM
			[Permission];

INSERT INTO [UserGroupPermission]
		SELECT 
			2, 
			[Id],
			1,
			0,
			0
		FROM
			[Permission];

INSERT INTO [UserGroupPermission]
		SELECT 
			3, 
			[Id],
			0,
			0,
			0
		FROM
			[Permission];