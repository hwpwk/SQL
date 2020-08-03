-- 参考：https://sql-oracle.com/sqlserver/?p=199
SELECT
    SUBSTRING([勘定科目], 7, 1000) AS [勘定科目名]
FROM
   tbl
;