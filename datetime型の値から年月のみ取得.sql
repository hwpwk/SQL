/*
「2021-05-01 00:00:00.000」から「202105」を取得
*/
SELECT
    FORMAT([年月日時間], 'yyyyMM') AS [年月]
FROM
    tbl
;