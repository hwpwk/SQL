USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('[ana].[VIEW_CreditCard_UnionAll(YearMonth)]') IS NOT NULL
    DROP VIEW [ana].[VIEW_CreditCard_UnionAll(YearMonth)]
GO

CREATE VIEW [ana].[VIEW_CreditCard_UnionAll(YearMonth)] AS

-- �����p������N���̂ݒ��o
-- 112: = yyyymmdd
-- LEFT�֐���yyyymm�̂ݒ��o
-- https://lightgauge.net/database/sqlserver/1531/
-- https://docs.microsoft.com/ja-jp/sql/t-sql/functions/cast-and-convert-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15
SELECT
      LEFT(CONVERT(NVARCHAR, [���p��], 112), 6) AS [���p�N��]
      ,[���p�X���E���i��]
      ,[�x�����z]
FROM 
      [ana].[VIEW_CreditCard_UnionAll]

GO
-------------------------------------------------------------------------

SELECT
      [���p�N��]
      ,[���p�X���E���i��]
      ,[�x�����z]
FROM
    [ana].[VIEW_CreditCard_UnionAll(YearMonth)]
;