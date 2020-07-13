SELECT 
    COUNT(*) AS [全数]	
   ,SUM(CASE WHEN [決算日]<=’2020-03-31’ THEN 1 ELSE 0 END) AS [FY20Q4までの件数]
   ,SUM(CASE WHEN [決算日]>’2020-03-31’ THEN 1 ELSE 0 END) AS [FY21Q1の件数]
FROM
    [Table]
