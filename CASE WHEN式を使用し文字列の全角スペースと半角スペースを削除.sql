SELECT 
      [コード]
      ,CASE
          WHEN [名] LIKE '% %' THEN REPLACE([名],' ', '' )
          WHEN [名] LIKE '%　%' THEN REPLACE([名],'　', '' )
          ELSE [名]
      END AS [名]
FROM
      tbl
;