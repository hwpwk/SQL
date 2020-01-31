-- 指定データベース内に作成したテーブルの名称とテーブル作成日を取得する
-- 参考：https://qiita.com/qsuke92/items/51a85a58ac91782ee528
USE [20018_大林道路]
GO

SELECT
  name AS [table_name]
  ,CAST(create_date AS DATE) AS [create_date]
FROM 
  sys.objects
WHERE
  type = 'U'