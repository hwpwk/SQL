USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('[ana].[Table_CreditCard_PIVOT]') IS NOT NULL
    DROP TABLE [ana].[Table_CreditCard_PIVOT]
GO

 SELECT
       [利用店名・商品名]
		,[201903]
		,[201904]
		,[201905]
		,[201906]
		,[201907]
		,[201908]
		,[201909]
		,[201910]
		,[201911]
		,[201912]
		,[202001]
		,[202002]
		,[202003]
		,[202004]
		,[202005]
		,[202006]
		,[202007]
		,[202008]
INTO
      [ana].[Table_CreditCard_PIVOT]
FROM
      [ana].[VIEW_CreditCard_IdentityVarification]
PIVOT 
	(SUM([支払総額])
	FOR 
		[利用年月]
	IN(
		 [201903]
		,[201904]
		,[201905]
		,[201906]
		,[201907]
		,[201908]
		,[201909]
		,[201910]
		,[201911]
		,[201912]
		,[202001]
		,[202002]
		,[202003]
		,[202004]
		,[202005]
		,[202006]
		,[202007]
		,[202008]
		)
	) AS p
;

SELECT * FROM [ana].[Table_CreditCard_PIVOT]