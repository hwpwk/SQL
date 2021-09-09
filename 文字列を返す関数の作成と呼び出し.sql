IF OBJECT_ID('TableName') IS NOT NULL
　DROP FUNCTION TableName
GO

-- 文字列を返す関数の作成
CREATE FUNCTION TableName()
RETURNS NVARCHAR(MAX)
AS

BEGIN
  RETURN N'[ana].[table]'
END

GO

-- 関数の呼び出し
SELECT dbo.TableName() AS [テーブル名]