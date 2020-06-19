SELECT
    [会社コード]
    ,AVG([仕入債務]) AS [仕入債務_平均]
    ,AVG([仕入債務回転日数]) AS [仕入債務回転日数_平均]
    ,COALESCE(NULLIF(STDEVP([仕入債務]), 0), 0) AS [仕入債務_母標準偏差]
    ,COALESCE(NULLIF(STDEVP([仕入債務回転日数]), 0), 0) AS [仕入債務回転日数_母標準偏差]
    ,COALESCE(STDEVP([仕入債務]) / NULLIF(AVG([仕入債務]), 0) , 0) AS [仕入債務_変動係数]
    ,STDEVP([仕入債務]) / NULLIF(AVG([仕入債務]), 0) AS [仕入債務_変動係数_NULL]
    ,COALESCE(STDEVP([仕入債務回転日数]) / NULLIF(AVG([仕入債務回転日数]), 0), 0)AS [仕入債務回転日数_変動係数]
    ,STDEVP([仕入債務回転日数]) / NULLIF(AVG([仕入債務回転日数]), 0) AS [仕入債務回転日数_変動係数_NULL]
FROM
    A
GROUP BY
    [会社コード]