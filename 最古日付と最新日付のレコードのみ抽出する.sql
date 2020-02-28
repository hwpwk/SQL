-- 最古日付と最新日付のレコードのみ抽出する
-- 参考：https://teratail.com/questions/155602
SELECT
    [NO]
    ,[日付]
    ,[売上]
FROM
    tmp2
WHERE
  [日付] = (SELECT MIN([日付]) FROM tmp2)
  OR
  [日付] = (SELECT MAX([日付]) FROM tmp2)