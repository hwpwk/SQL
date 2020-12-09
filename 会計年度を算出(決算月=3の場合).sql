-- 決算月=3月を想定
SELECT
    CASE
        WHEN MONTH([決算日])=3  THEN YEAR([決算日])
        ELSE YEAR([決算日]) + 1
    END AS [年度]
FROM
      tbl