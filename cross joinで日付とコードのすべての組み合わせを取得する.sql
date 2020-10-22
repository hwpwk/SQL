SELECT 
	[日付]
	,[コード] 
FROM 
	(SELECT DISTINCT [日付] FROM mst1) AS DayTBL
CROSS JOIN
	(SELECT DISTINCT [コード] FROM mst2) AS CodeTBL
;