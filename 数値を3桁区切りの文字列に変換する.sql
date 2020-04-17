SELECT 
    FORMAT(SUM([当月＿売上高]),'N') AS 当月売上高合計
FROM
    [Order_FINAL]
;

--→874,901,798,491.00というように3桁区切りの文字列に変換される
-- 参考：https://ichiroku11.hatenablog.jp/entry/2014/01/21/234846 