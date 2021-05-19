-- 傾き=共分散÷分散
-- 共分散 = (Xの偏差×Yの偏差)の平均(=(Xの偏差×Yの偏差)の合計÷個数)
SELECT
    AVG([DIV_x]*[DIV_y]) OVER(PARTITION BY [c1],[c2],[c3]) / NULLIF([VARP_x], 0) / NULLIF([AVG_y], 0) AS [Slope(adjusted)]
    ,AVG([DIV_x]*[DIV_y]) OVER(PARTITION BY [c1],[c2],[c3]) / NULLIF([VARP_x], 0) AS [Slope]
FROM
    tmp