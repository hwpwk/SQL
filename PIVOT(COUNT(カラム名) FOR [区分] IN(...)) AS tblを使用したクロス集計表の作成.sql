SELECT
	  [�敪]
	  ,SUM([��10��]) AS [��10��]
	  ,SUM([��20��]) AS [��20��]
	  ,SUM([��30��]) AS [��30��]
	  ,SUM([��40��]) AS [��40��]
	  ,SUM([��50��]) AS [��50��]
	  ,SUM([��60��]) AS [��60��]
	  ,SUM([��70��]) AS [��70��]
	  ,SUM([��80��]) AS [��80��]
	  ,SUM([��90��]) AS [��90��]
	  ,SUM([��100��]) AS [��100��]
	  ,SUM([100%>]) AS [100%>]
FROM
    tbl
PIVOT (
  �@COUNT([�R�[�h]) FOR [�i�����敪] IN ([��10��],[��20��],[��30��],[��40��],[��50��],[��60��],[��70��],[��80��],[��90��],[��100��],[100%>])
) AS PV
GROUP BY
    [�敪]
