/* WITH����ORDER BY�������Ƃ���row_number()���g�p���� */
WITH tmp AS(
    SELECT
	    ROW_NUMBER() OVER (ORDER BY [�s] DESC) AS [�s]
     FROM tbl
 )
 
SELECT
     *
FROM
   tmp