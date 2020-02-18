-- 指定データベース内に作成したテーブルの名称とデータ件数を取得する
-- 参考：http://jp.innoya.com/board/ViewTip.aspx?menuid=4&idx=330
USE [20018_大林道路]
GO

SELECT
  A.name AS [TableName]
  ,B.rows AS [データ件数]
FROM
  sys.objects AS A
INNER JOIN 
  sys.sysindexes AS B
ON 
  A.object_id = B.id AND B.indid < 2
WHERE
  A.type = 'U'
