-- 参考：https://qiita.com/ShibuyaKosuke/items/f83f43898920daf01e7b

DECLARE @closing_month INTEGER
SET @closing_month=3 -- 決算月

SELECT 
    [決算日]
    ,YEAR([決算日]) AS [決算年]
    -- 決算月に合わせた会計年度を抽出
    ,YEAR(DATEADD(MONTH, -(@closing_month%12) ,[決算日]) ) AS [会計年度]
FROM
    [Demo]
;
