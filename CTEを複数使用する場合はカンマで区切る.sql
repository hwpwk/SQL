/* CTEを複数使用する場合、
WITH テーブル名1 AS( ),
テーブル名2 AS( ) 
SELECT *FROM テーブル名2
というようにカンマを使用する
参考：https://riptutorial.com/ja/sql-server/example/23133/%E8%A4%87%E6%95%B0%E3%81%AEas%E3%82%B9%E3%83%86%E3%83%BC%E3%83%88%E3%83%A1%E3%83%B3%E3%83%88%E3%82%92%E6%8C%81%E3%81%A4cte
*/
-- 例
WITH tmp1 AS(
SELECT　
    [日付]
    ,SUM([原価]) AS [原価_合計]
FROM
   [Table_data]
WHERE
   [日付]='2015-12-01' OR [日付]='2018-05-01'
GROUP BY
    [日付]
)
-- WITHではなくカンマを使用する
,tmp2 AS(
SELECT
    MAX(CASE WHEN [日付]='2015-12-01' THEN [原価_合計] END) AS [最古見積原価]
    ,MAX(CASE WHEN [日付]='2018-05-01' THEN [原価_合計] END) AS [最新見積原価]
FROM
    tmp1
)

SELECT
    *
FROM
  tmp2