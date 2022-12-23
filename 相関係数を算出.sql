-- [id],[品目]毎の[価格(円)]と[date]の相関係数を算出する

-- [date]をシリアル値にするために最初にdatetime型に変換した上でinteger型への変換を実施
WITH raw_tbl AS(
		SELECT
			[id]
			,[品目]
			,[価格(円)]
			 ,CONVERT(BIGINT, CONVERT(DATETIME, [date])) AS [date_int]
		FROM
			tbl
)
-- [id],[品目]毎の[価格(円)]と[date_int]の平均値と標準偏差を算出
, avg_std AS(
		SELECT
			AVG([価格(円)]) OVER(PARTITION BY [id],[品目]) AS [平均_価格(円)]
			,STDEVP([価格(円)]) OVER(PARTITION BY [id],[品目])) AS [標準偏差_価格(円)]
			,AVG([date_int]) OVER(PARTITION BY [id],[品目]) AS [平均_date_int)]
			,STDEVP([date_int]) OVER(PARTITION BY [id],[品目])) AS [標準偏差_date_int]
		FROM
		    raw_tbl
)
--  各行の[価格(円)]と[date_int]の値から[id],[品目]毎の[価格(円)]と[date_int]の平均値を差し引いて偏差を算出
, dev AS(
		SELECT
				[平均_価格(円)]
				,[標準偏差_価格(円)]
				,[価格(円)] - [平均_価格(円)] AS [偏差_価格(円)]
				,[平均_date_int)]
				,[標準偏差_date_int]
				,[date_int] - [平均_date_int] AS [偏差_date_int]
		FROM
				  avg_std
)
--  [id],[品目]毎の[価格(円)]と[date]の相関係数( 共分散÷(xの標準偏差×yの標準偏差) )を算出
SELECT
	ROUND(
	    AVG([偏差_価格(円)] * [偏差_date_int]) OVER(PARTITION BY [id],[品目]) / NULLIF([標準偏差_価格(円)] * [標準偏差_date_int], 0)
	, 5) AS [相関係数_価格(円)とdate]
FROM
    dev
;
