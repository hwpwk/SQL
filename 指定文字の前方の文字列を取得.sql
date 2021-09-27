--[レベル]列の値の「_」より前方の文字列を抽出する
SELECT
    SUBSTRING([レベル], 1,CHARINDEX('_', [レベル])-1)
FROM
    tbl
;