-- 参考URL：https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q10162717075
------------------------------------------
-- データベース名指定なしバージョン
------------------------------------------
DECLARE @Code NVARCHAR(MAX)
DECLARE @TableName NVARCHAR(MAX)

SET @TableName =  N'[dbo].[table]'

-- 先頭10行目までを取得するクエリ
SET @Code =N'SELECT TOP(10)* FROM ' + @TableName

--文字列のクエリを動的に実行
EXEC SP_EXECUTESQL @Code
;