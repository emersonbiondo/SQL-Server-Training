USE [ProjectSQL]
GO

SET IDENTITY_INSERT [Permission] ON;

INSERT INTO [Permission]
	(
		[Id],
		[Name],
		[Description],
		[Key]
	)
	VALUES
		(1,'User','Access User','USER'),
		(2,'User Group','Access User Group','USERGROUP'),
		(3,'Attribute','Access Attribute','ATTRIBUTE'),
		(4,'Product','Access Product','PRODUCT'),
		(5,'Product Group','Access Product Group','PRODUCTGROUP'),
		(6,'Output Product','Access Output Product','OUTPUTPRODUCT');

SET IDENTITY_INSERT [Permission] OFF;
