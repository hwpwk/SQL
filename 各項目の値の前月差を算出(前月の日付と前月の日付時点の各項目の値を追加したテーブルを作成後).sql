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
-- 前月の日付、sales、costを追加したテーブル(tmp2)を作成
, tmp2 AS(
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
)
-- sales、costの値の前月差を算出
SELECT
    [日付] 
	,[sales]
	,[cost]
	,[前月日付]
	,[前月sales]
	,[前月cost]
	,[sales] - [前月sales] AS [前月sales_diff]
	,[cost] - [前月cost] AS [前月cost_diff]
FROM
    tmp2
