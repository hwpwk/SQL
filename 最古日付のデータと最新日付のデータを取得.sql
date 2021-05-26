SELECT
   -- 最古日付時点の金額を取得
    FIRST_VALUE([SUM_Amount in LC]) 
　　　OVER(PARTITION BY [col1], [col2] ORDER BY [Date]) AS [MinDayAmount]
　-- 最新年月の末日時点の金額を取得(年度毎)
　,LAST_VALUE([SUM_Amount in LC]) 
　　　OVER(PARTITION BY [col1], [col2] ORDER BY [Date] ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [MaxDayAmount]
FROM
　tmp_tbl
;