/*
年月・利用店名毎の支払総額の平均と年月・利用店名毎の利用回数の相関係数を算出する
*/
USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('[ana].[VIEW_BeforeCalcCorrelatoinCoefficient]') IS NOT NULL
   DROP VIEW [ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
GO

CREATE VIEW [ana].[VIEW_BeforeCalcCorrelatoinCoefficient] AS

WITH AddYearMonth AS(
		SELECT
			LEFT([利用日], 4) + SUBSTRING(CAST([利用日] AS NVARCHAR), 6, 2) AS [年月]
			,[利用日]
			,[利用店名・商品名] AS [利用店名]
			,[支払総額]
		FROM
			[ana].[Table_CreditCard_IdentityVarification]
)--868
-- 1つ目の要素(年月・利用店名毎の支払総額の平均値)の算出
, AvgPriceByYearMonthByStore AS(
		SELECT
			[年月]
			,[利用店名]
			,AVG([支払総額]) AS [平均支払総額By年月・利用店名]
		FROM
			AddYearMonth
		GROUP BY
			[年月]
			,[利用店名]
) -- 187
-- 2つ目の要素(年月・利用店名毎の利用回数)の算出
, CntByYearMonthByStore AS(
		SELECT
			[年月]
			,[利用店名]
			,COUNT([支払総額]) AS [利用回数By年月・利用店名]
		FROM
			AddYearMonth
		GROUP BY
			[年月]
			,[利用店名]
) -- 187
-- それぞれの要素を算出したテーブルを結合し、それぞれの要素の平均値と標準偏差を取得
-- 集計単位でユニークになっているか確認するためここでViewに切り出す
SELECT
	A.[年月]
    ,A.[利用店名]
	,[平均支払総額By年月・利用店名]
    ,[利用回数By年月・利用店名]
	-- 相関係数算出に使用する分子の平均値については全期間における平均支払総額と利用回数を算出
	,AVG([平均支払総額By年月・利用店名]) OVER(PARTITION BY A.[利用店名])  AS [平均支払総額By利用店名]
	,AVG([利用回数By年月・利用店名]) OVER(PARTITION BY  A.[利用店名]) AS [平均利用回数By利用店名]
	-- 相関係数が欠損値の場合の確認用としてこの時点で標準偏差も算出
	-- →相関係数算出に使用する分母のそれぞれの標準偏差が0になっている可能性が高いため
	,STDEVP([平均支払総額By年月・利用店名]) OVER(PARTITION BY A.[利用店名])  AS [標準偏差支払総額By利用店名]
	,STDEVP([利用回数By年月・利用店名]) OVER(PARTITION BY  A.[利用店名]) AS [標準偏差利用回数By利用店名]
FROM
    AvgPriceByYearMonthByStore AS A
LEFT OUTER JOIN
    CntByYearMonthByStore AS C
ON
    A.[年月] = C.[年月]
	AND A.[利用店名] = C.[利用店名]
GO
;

-- 集計単位でユニークになっているか確認
SELECT
    COUNT(*) AS [n]
	,COUNT(DISTINCT [年月] +[利用店名] ) AS [distinct_n]
FROM
    [FeeForUsingCreditCard2].[ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
;
  

  -- 偏差の算出から相関係数の算出まで
  IF OBJECT_ID('[ana].[VIEW_CalcCorrelatoinCoefficient]') IS NOT NULL
   DROP VIEW [ana].[VIEW_CalcCorrelatoinCoefficient]
GO

CREATE VIEW [ana].[VIEW_CalcCorrelatoinCoefficient] AS
-- 偏差の算出
WITH Diviation AS(
		SELECT
			  [年月]
			  ,[利用店名]
			  ,[平均支払総額By年月・利用店名]
			  ,[利用回数By年月・利用店名]
			  ,[平均支払総額By利用店名]
			  ,[平均利用回数By利用店名]
			  ,[標準偏差支払総額By利用店名]
			  ,[標準偏差利用回数By利用店名]
			  ,[平均支払総額By年月・利用店名] - [平均支払総額By利用店名] AS [偏差_平均支払総額]
			  ,[利用回数By年月・利用店名] - [平均利用回数By利用店名] AS [偏差_利用回数]
		FROM 
			  [ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
)
-- 相関係数の算出
SELECT
      [年月]
      ,[利用店名]
      ,[平均支払総額By年月・利用店名]
      ,[利用回数By年月・利用店名]
      ,[平均支払総額By利用店名]
      ,[平均利用回数By利用店名]
      ,[標準偏差支払総額By利用店名]
      ,[標準偏差利用回数By利用店名]
	  ,[偏差_平均支払総額]
	  ,[偏差_利用回数]
	  -- 分子と分母の集計単位を揃える
	  ,AVG([偏差_平均支払総額]*[偏差_利用回数]) OVER (PARTITION BY [利用店名])
	  /NULLIF(
	  STDEVP([平均支払総額By年月・利用店名]) OVER(PARTITION BY [利用店名])*STDEVP([利用回数By年月・利用店名]) OVER(PARTITION BY [利用店名])
	  , 0) AS [相関係数_平均支払総額と利用回数By利用店名]
	  -- 確認用
	  ,AVG([偏差_平均支払総額]*[偏差_利用回数]) OVER (PARTITION BY [利用店名])
	  /NULLIF(
	  [標準偏差支払総額By利用店名]*[標準偏差利用回数By利用店名]
	  , 0) AS [相関係数_平均支払総額と利用回数By利用店名_chk]
	  ,COUNT(*) OVER (PARTITION BY [利用店名]) AS [件数By利用店名]
FROM 
    Diviation
GO
;

-- 相関係数の値が-1以上1以下であるかどうか確認
SELECT
    MIN([相関係数_平均支払総額と利用回数By利用店名]) AS [Min相関係数]
	,MAX([相関係数_平均支払総額と利用回数By利用店名]) AS [Max相関係数]
FROM
     [ana].[VIEW_CalcCorrelatoinCoefficient]
;

SELECT
    COUNT(DISTINCT [利用店名]) AS [cnt利用店名]
	-- 相関係数と件数がNULLの場合は0を補完している
	,COUNT(DISTINCT [利用店名] 
	+ CAST(COALESCE([相関係数_平均支払総額と利用回数By利用店名], 0) AS NVARCHAR)
	+  CAST(COALESCE([件数By利用店名], 0) AS NVARCHAR)
	) AS [cnt利用店名+相関係数+件数]

FROM 
        [ana].[VIEW_CalcCorrelatoinCoefficient]
;