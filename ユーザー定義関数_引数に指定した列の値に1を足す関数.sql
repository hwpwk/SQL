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
      [�N��]
      ,[���p�X��]
      ,[���p��By�N���E���p�X��]
	  ,dbo.FuncPlus1([���p��By�N���E���p�X��]) AS [���p��+1��By�N���E���p�X��]
	  ,dbo.FuncPlus1([���p��By�N���E���p�X��]) - [���p��By�N���E���p�X��] AS [+1����Ă��邩�m�F�p]
FROM 
      [ana].[VIEW_CalcCorrelatoinCoefficient]
;