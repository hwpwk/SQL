-- 一時テーブル(tmp)を作成
WITH tmp AS (
    SELECT  '2017-09-01' AS '日付', 1000 AS 'sales', 500 AS 'cost'
	UNION ALL
	SELECT  '2017-10-01' AS '日付', 900 AS 'sales', 600 AS 'cost'
	UNION ALL
	SELECT  '2017-11-01' AS '日付', 1900 AS 'sales', 900 AS 'cost'
	UNION ALL
	SELECT  '2017-12-01' AS '日付', 900 AS 'sales', 700 AS 'cost'
)
-- 前月の日付、sales、costを追加
SELECT
    A.[日付] 
	,A.[sales]
	,A.[cost]
	,B.[日付] AS [前月日付]
	,B.[sales] AS [前月sales]
	,B.[cost] AS [前月cost]
FROM
	tmp AS A
	LEFT OUTER JOIN
	tmp AS B
    ON
	B.[日付] = DATEADD(month, -1, A.[日付])