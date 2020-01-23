/* 
[売上年月]に「0」が含まれている場合を想定
CASE式を使用して[売上年月]が「0」の場合にはNULLを返し、
[売上年月]がそれ以外の場合に文字列の末尾に「01」を追加してDATE型にする
*/

SELECT
  [売上年月]
  ,CASE
     WHEN [売上年月] =0 THEN NULL
	 ELSE CAST(CAST(NULLIF([売上年月],0) AS VARCHAR) +'01' AS date)
   END AS [売上年月_DATE型_CASE]
  ,CAST(NULLIF([売上年月],0) AS VARCHAR)+'01' AS  [売上年月_文字列型_NULLIF]
  ,COUNT(*) AS [データ件数]
FROM 
  [dbo].[talbeまとめ]
GROUP BY
  [売上年月]