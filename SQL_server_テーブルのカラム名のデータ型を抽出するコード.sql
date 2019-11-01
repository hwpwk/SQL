SELECT
  name AS [カラム名]
  ,type_name([user_type_id]) AS [データ型]
FROM
  sys.columns
WHERE
  object_id = object_id('[raw].[2016_6_30会社別精算表_1]')
;
