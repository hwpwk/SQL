-- コード毎の最新の決算日、最大の金額、最新の年月、を最大の番号を取得したテーブル(=MAX_DayAndMoney_TBL)を作成
WITH MAX_DayAndMoney_TBL AS(
		SELECT 
			  [コード]
			  ,MAX([決算日]) AS [決算日]
			  ,MAX(CAST([金額] AS NUMERIC(19,2))) AS [金額]
			  ,MAX([手続年月]) AS [手続年月]
			  ,MAX([番号]) AS [番号]
		FROM 
			  [ana].[Table_Union_All_建設事業報告一覧]
		GROUP BY
			  [コード]
)
--  決算日、コード、金額、手続年月、事業報告申込書をキーにしてMAX_DayAndMoney_TBLと[ana].[Table_Union_All_建設事業報告一覧]を結合したテーブル(=MASTER_TBL1)を作成
-- この時点ではコードに重複がある
, MASTER_TBL1 AS(
		SELECT 
			  M.[決算日]
			  ,M.[コード]
			  ,[用途大分類]
			  ,[用途大分類名称]
			  ,[建土区分]
			 -- ,M.[金額]
			 ,ROW_NUMBER() OVER (PARTITION BY M.[コード] ORDER BY M.[コード]) AS [row] -- 重複削除用に作成
		FROM
			  MAX_DayAndMoney_TBL AS M
		LEFT OUTER JOIN
			  [ana].[Table_Union_All_建設事業報告一覧] AS A
		ON
　　		  M.[決算日] = A.[決算日] AND M.[コード] = A.[コード] AND M.[金額] = CAST(A.[金額] AS NUMERIC(19,2))
　　		  AND M.[手続年月] = A.[手続年月] AND M.[番号] = A.[番号]
)
-- コード(ユニーク)毎の工種と建土区分を取得
SELECT 
      [決算日]
      ,[コード]
      ,[用途大分類]
      ,[用途大分類名称]
      ,[建土区分]
	  ,[row]
FROM
      MASTER_TBL1
WHERE
      [row] = 1
;