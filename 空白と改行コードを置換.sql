SELECT
      REPLACE([勘定科目コード], ' ','')  -- 空白の削除
      ,REPLACE([勘定科目コード], CHAR(10), '') -- 改行の削除(いろいろパターンがあり、CHAR(10)だけではないことに注意)
FROM
      tbl
-- 参考
-- https://sql55.com/query/remove-carriage-return.php
-- https://sql-oracle.com/sqlserver/?p=1004
