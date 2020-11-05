-- 6桁未満のコードについては「0」で埋める
SELECT
      [決算日]
      -- FROMAT関数は文字列型のカラムを扱うことができないのでINTに変換している
      ,CASE
         WHEN LEN([コード])<6 THEN FORMAT(CAST([コード] AS INT), '000000')
         ELSE [コード]
      END AS [コード]
FROM
      [dbo].[tbl]