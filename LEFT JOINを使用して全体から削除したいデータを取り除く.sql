-- 削除したいデータを集めたテーブル(=Delete_TBL)を作成
WITH Delete_TBL AS(
		SELECT 
			[決算日]
			,[会社コード]
			,[勘定科目コード]
			,[金額]
			,[BSPL/CF]
		FROM
			tbl1
		WHERE
		   ([決算日]>='2017-06-30' AND [決算日]<= '2017-12-31'  AND [会社コード] IN ('432S9999'))
			OR
			([決算日]>='2018-06-30' AND [決算日]<= '2018-09-30'  AND [会社コード] IN ('011S2678'))
			OR
			([決算日]>='2019-09-30' AND [決算日]<= '2019-12-31'  AND [会社コード] IN ('110K0218','806S9999'))
)
/*
・①全体(=tbl1)
・②削除したいデータを集めたテーブル(=Delete_TBL)
上記2つのテーブルをLEFT JOINして②のデータが紐づかないデータを取得
*/
SELECT
	U.[日]
	,U.[コード]
	,U.[金額]
FROM
	tbl1 AS U
LEFT OUTER JOIN
	Delete_TBL AS D
ON
	U.[日]=D.[日] AND U.[コード]=D.[コード]
WHERE
	D.[日] IS NULL
;