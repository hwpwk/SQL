-- [フラグ]カラムが「BSPL」かつ[コード]カラムの文字列1文字目がアルファベットのレコードの[金額]カラムの値を合計したカラムを作成
-- 参考：https://qiita.com/hisaitami/items/2ede408806088e634eed
SELECT 
  [決算日]
  ,SUM(CASE WHEN [フラグ]='BSPL' AND  SUBSTRING([コード], 1, 1) like '[A-Za-z]'  THEN [金額] ELSE 0 END) AS [PL合計]
FROM
  [財務諸表]
GROUP BY
  [決算日]
;