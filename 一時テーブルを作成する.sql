--�Q�l�����F�r�b�O�f�[�^���́E���p�̂��߂�SQL���V�s
WITH tmp AS (
    SELECT  '2017-09-01' AS '���t', 1000 AS 'sales', 500 AS 'cost'
	UNION ALL
	SELECT  '2017-10-01' AS '���t', 900 AS 'sales', 600 AS 'cost'
	UNION ALL
	SELECT  '2017-11-01' AS '���t', 1900 AS 'sales', 900 AS 'cost'
	UNION ALL
	SELECT  '2017-12-01' AS '���t', 900 AS 'sales', 700 AS 'cost'
)

SELECT
    [���t]
	,[sales]
	,[cost]
FROM
    tmp
