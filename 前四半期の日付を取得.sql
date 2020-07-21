SELECT
    [決算年月日]
    ,DATEADD(DAY, -1 ,DATEADD(MONTH, -3 ,DATEADD(DAY, 1, [決算年月日]))) AS [前四半期_決算年月日]
FROM
    tbl
;