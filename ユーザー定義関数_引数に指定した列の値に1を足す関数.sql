USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('FuncPlus1') IS NOT NULL
  DROP FUNCTION FuncPlus1
GO

CREATE FUNCTION FuncPlus1(@n FLOAT)
RETURNS FLOAT
AS
BEGIN
		DECLARE @plus_num FLOAT
		SELECT @plus_num = @n + 1
		RETURN @plus_num
END

GO

SELECT 
      [年月]
      ,[利用店名]
      ,[利用回数By年月・利用店名]
	  ,dbo.FuncPlus1([利用回数By年月・利用店名]) AS [利用回数+1回By年月・利用店名]
	  ,dbo.FuncPlus1([利用回数By年月・利用店名]) - [利用回数By年月・利用店名] AS [+1されているか確認用]
FROM 
      [ana].[VIEW_CalcCorrelatoinCoefficient]
;