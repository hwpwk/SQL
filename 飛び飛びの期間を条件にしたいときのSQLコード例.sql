/* 
2016/4/1~2016/6/30と2017/4/1~2018/9/30のデータを取得する 
まず、betweenで全期間を指定したサブクエリを作成、次に not betweenを使って必要のない期間を除くようにする
*/
SELECT
  *
FROM
  (SELECT 
      [日付]
      ,[フラグ]
      ,[通貨額]
      ,[明細テキスト]
      ,[FileName]
   FROM
     [PJ].[raw].[data_201304-201909]
   WHERE
     [フラグ]='D'
     AND
     [日付] between '2016-04-01' and '2018-09-30') as tmp1
WHERE
  [日付] not between '2016-07-01' and '2017-03-31'
ORDER BY
  [日付]
;