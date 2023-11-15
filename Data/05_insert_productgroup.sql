USE [ProjectSQL]
GO

--CHANGE VALUE CHANGE THE VARIABLE TO THE FILE LOCATION
DECLARE @fileProductGroup AS VARCHAR(MAX) = '..\ProductGroup.xml';
DECLARE @SQL NVARCHAR(MAX);
DECLARE @XML XML;

SET @SQL = N'SELECT @OUTPUT=CAST(MY_XML AS xml) FROM OPENROWSET(BULK ''' + @fileProductGroup + N''', SINGLE_BLOB) AS T(MY_XML);';

exec sp_executesql @SQL, N'@OUTPUT xml out', @XML out;

INSERT INTO [ProductGroup]
	SELECT
	   MY_XML.ProductGroup.query('Name').value('.', 'VARCHAR(50)'),
	   MY_XML.ProductGroup.query('Description').value('.', 'VARCHAR(200)')
	FROM (SELECT @XML) AS T(MY_XML)
		  CROSS APPLY MY_XML.nodes('ProductGroups/ProductGroup') AS MY_XML (ProductGroup);