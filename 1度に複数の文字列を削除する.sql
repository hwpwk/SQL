-- 例えば値の1つがNVARCHAR型の「5,700%」のようなカラムをNUMERIC型の「57.0」のような数値型に変換する
SELECT
　CAST(REPLACE(REPLACE([利益率], ',',''), '%', '')  AS NUMERIC(25,1)) / 100 AS [利益率]
FROM
　tbl
;