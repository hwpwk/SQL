-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- 利用年月における支払総額の大きさの第一四分位数、中央値、第三四分位数を取得する
--PERCENTILE_CONT ではデータセットに存在するかどうかに関係なく適切な値が挿入され、PERCENTILE_DISC では常にセットから実際の値を返す。
-- 参考：https://docs.microsoft.com/ja-jp/sql/t-sql/functions/percentile-cont-transact-sql?view=sql-server-ver15
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT DISTINCT 
      [利用年月]
      ,PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS First_Quartile_C
	  ,PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS First_Quartile_D
	  ,PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Median_Quartile_C
	  ,PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Median_Quartile_D
	  ,PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Third_Quartile_C
	  ,PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Third_Quartile_D
	  ,PERCENTILE_CONT(1.00) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Third_Quartile_C
	  ,PERCENTILE_DISC(1.00) WITHIN GROUP (ORDER BY [支払総額]) OVER (PARTITION BY [利用年月]) AS Third_Quartile_D
FROM
　　[FeeForUsingCreditCard2].[ana].[VIEW_CreditCard_IdentityVarification]