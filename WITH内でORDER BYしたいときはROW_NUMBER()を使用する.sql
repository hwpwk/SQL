/* WITH内でORDER BYしたいときはrow_number()を使用する */
WITH tmp AS(
    SELECT
	    ROW_NUMBER() OVER (ORDER BY [行] DESC) AS [行]
     FROM tbl
 )
 
SELECT
     *
FROM
   tmp