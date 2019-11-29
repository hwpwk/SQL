--  sysobjects.name にカラム名を抽出したい該当のテーブル名を指定する
SELECT
    syscolumns.name
FROM
    syscolumns
INNER JOIN sysobjects ON
    sysobjects.id = syscolumns.id
WHERE
    sysobjects.name = 'table_name'
;

-- 参考：https://lightgauge.net/database/sqlserver/1491/
