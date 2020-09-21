USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('[ana].[VIEW_CreditCard_UnionAll(YearMonth)]') IS NOT NULL
    DROP VIEW [ana].[VIEW_CreditCard_UnionAll(YearMonth)]
GO

CREATE VIEW [ana].[VIEW_CreditCard_UnionAll(YearMonth)] AS

-- ★利用日から年月のみ抽出
-- 112: = yyyymmdd
-- LEFT関数でyyyymmのみ抽出
-- https://lightgauge.net/database/sqlserver/1531/
-- https://docs.microsoft.com/ja-jp/sql/t-sql/functions/cast-and-convert-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15
SELECT
      LEFT(CONVERT(NVARCHAR, [利用日], 112), 6) AS [利用年月]
      ,[利用店名・商品名]
      ,[支払総額]
FROM 
      [ana].[VIEW_CreditCard_UnionAll]

GO
-------------------------------------------------------------------------

SELECT
      [利用年月]
      ,[利用店名・商品名]
      ,[支払総額]
FROM
    [ana].[VIEW_CreditCard_UnionAll(YearMonth)]
;