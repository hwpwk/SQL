--参考文献：ビッグデータ分析・活用のためのSQLレシピ
WITH tmp AS (
    SELECT  '2017-09-01' AS '日付', 1000 AS 'sales', 500 AS 'cost'
	UNION ALL
	SELECT  '2017-10-01' AS '日付', 900 AS 'sales', 600 AS 'cost'
	UNION ALL
	SELECT  '2017-11-01' AS '日付', 1900 AS 'sales', 900 AS 'cost'
	UNION ALL
	SELECT  '2017-12-01' AS '日付', 900 AS 'sales', 700 AS 'cost'
)

SELECT
    [日付]
	,[sales]
	,[cost]
FROM
    tmp
