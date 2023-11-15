USE [ProjectSQL];
GO

CREATE TABLE [UserGroup_User]
	(
		[Id] INT IDENTITY(1,1) NOT NULL,
		[UserGroupId] INT NOT NULL,
		[UserId] INT NOT NULL
	);

ALTER TABLE [UserGroup_User] 
	ADD CONSTRAINT [PK_UserGroup_User] PRIMARY KEY CLUSTERED 
	(
		[Id]
	);

ALTER TABLE [UserGroup_User] 
	ADD CONSTRAINT [IU_UserGroup_User] UNIQUE NONCLUSTERED 
	(
		[UserGroupId],
		[UserId]
	);

ALTER TABLE [UserGroup_User]
	ADD CONSTRAINT [FK_UserGroup_User_UserGroup] 
	FOREIGN KEY([UserGroupId]) 
	REFERENCES [UserGroup]([Id]);

ALTER TABLE [UserGroup_User]
	ADD CONSTRAINT [FK_UserGroup_User_User] 
	FOREIGN KEY([UserId]) 
	REFERENCES [User]([Id]);