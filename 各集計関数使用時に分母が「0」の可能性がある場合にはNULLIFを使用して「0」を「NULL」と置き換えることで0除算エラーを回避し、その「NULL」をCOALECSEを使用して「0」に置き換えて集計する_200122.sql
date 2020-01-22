-- 各集計関数使用時に分母が「0」の可能性がある場合にはNULLIFを使用して「0」を「NULL」と置き換えることで0除算エラーを回避し、その「NULL」をCOALECSEを使用して「0」に置き換えて集計する
SELECT
  [品名]
  ,COUNT(*) AS [データ件数]
  ,SUM([単価]) AS [単価合計]
  ,AVG([単価]) AS [AVG_平均単価]
  ,ROUND(SUM([単価]) / COUNT(*), 1)AS [round_平均単価]
  ,SUM([単価]) / COUNT(*) AS [平均単価]
  ,NULLIF(STDEV([単価]), 0) AS [単価_標本標準偏差_NULL]
  ,NULLIF(STDEVP([単価]), 0) AS [単価_母標準偏差_NULL]
  ,COALESCE(NULLIF(STDEV([単価]), 0), 0) AS [単価_標本標準偏差_0]
  ,COALESCE(NULLIF(STDEVP([単価]), 0), 0) AS [単価_母標準偏差_0]
  ,NULLIF(STDEV([単価]), 0) / NULLIF(AVG([単価]) , 0) AS [単価_変動係数(標本標準偏差使用)_NULL]
  ,NULLIF(STDEVP([単価]), 0)  / NULLIF(AVG([単価]), 0)  AS [単価_変動係数(母標準偏差使用)_NULL]
  ,COALESCE(NULLIF(STDEV([単価]), 0) / NULLIF(AVG([単価]) , 0), 0) AS [単価_変動係数(標本標準偏差使用)_0]
  ,COALESCE(NULLIF(STDEVP([単価]), 0)  / NULLIF(AVG([単価]), 0), 0)  AS [単価_変動係数(母標準偏差使用)_0]
FROM 
  [dbo].[データまとめ_2018]
GROUP BY
  [品名]
ORDER BY
  [単価合計] desc