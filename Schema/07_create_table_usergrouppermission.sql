USE [ProjectSQL];
GO

CREATE TABLE [UserGroupPermission]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[UserGroupId] INT NOT NULL,
		[PermissionId] INT NOT NULL,
		[Read] BIT NOT NULL,
		[Update] BIT NOT NULL,
		[Delete] BIT NOT NULL,
	);

ALTER TABLE [UserGroupPermission] 
	ADD CONSTRAINT [PK_UserGroupPermission] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [UserGroupPermission] 
	ADD CONSTRAINT [IU_UserGroupPermission] UNIQUE NONCLUSTERED 
	(
		[UserGroupId],
		[PermissionId]
	);

ALTER TABLE [UserGroupPermission]
	ADD CONSTRAINT [FK_UserGroupPermission_UserGroup] 
	FOREIGN KEY([UserGroupId]) 
	REFERENCES [UserGroup]([Id]);

ALTER TABLE [UserGroupPermission]
	ADD CONSTRAINT [FK_UserGroupPermission_Permission] 
	FOREIGN KEY([PermissionId]) 
	REFERENCES [Permission]([Id]);