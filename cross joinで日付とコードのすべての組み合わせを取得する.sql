SELECT 
	[���t]
	,[�R�[�h] 
FROM 
	(SELECT DISTINCT [���t] FROM mst1) AS DayTBL
CROSS JOIN
	(SELECT DISTINCT [�R�[�h] FROM mst2) AS CodeTBL
;