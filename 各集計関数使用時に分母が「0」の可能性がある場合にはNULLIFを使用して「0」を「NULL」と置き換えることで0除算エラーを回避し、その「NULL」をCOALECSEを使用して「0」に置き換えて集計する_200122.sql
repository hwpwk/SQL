-- �e�W�v�֐��g�p���ɕ��ꂪ�u0�v�̉\��������ꍇ�ɂ�NULLIF���g�p���āu0�v���uNULL�v�ƒu�������邱�Ƃ�0���Z�G���[��������A���́uNULL�v��COALECSE���g�p���āu0�v�ɒu�������ďW�v����
SELECT
  [�i��]
  ,COUNT(*) AS [�f�[�^����]
  ,SUM([�P��]) AS [�P�����v]
  ,AVG([�P��]) AS [AVG_���ϒP��]
  ,ROUND(SUM([�P��]) / COUNT(*), 1)AS [round_���ϒP��]
  ,SUM([�P��]) / COUNT(*) AS [���ϒP��]
  ,NULLIF(STDEV([�P��]), 0) AS [�P��_�W�{�W���΍�_NULL]
  ,NULLIF(STDEVP([�P��]), 0) AS [�P��_��W���΍�_NULL]
  ,COALESCE(NULLIF(STDEV([�P��]), 0), 0) AS [�P��_�W�{�W���΍�_0]
  ,COALESCE(NULLIF(STDEVP([�P��]), 0), 0) AS [�P��_��W���΍�_0]
  ,NULLIF(STDEV([�P��]), 0) / NULLIF(AVG([�P��]) , 0) AS [�P��_�ϓ��W��(�W�{�W���΍��g�p)_NULL]
  ,NULLIF(STDEVP([�P��]), 0)  / NULLIF(AVG([�P��]), 0)  AS [�P��_�ϓ��W��(��W���΍��g�p)_NULL]
  ,COALESCE(NULLIF(STDEV([�P��]), 0) / NULLIF(AVG([�P��]) , 0), 0) AS [�P��_�ϓ��W��(�W�{�W���΍��g�p)_0]
  ,COALESCE(NULLIF(STDEVP([�P��]), 0)  / NULLIF(AVG([�P��]), 0), 0)  AS [�P��_�ϓ��W��(��W���΍��g�p)_0]
FROM 
  [dbo].[�f�[�^�܂Ƃ�_2018]
GROUP BY
  [�i��]
ORDER BY
  [�P�����v] desc