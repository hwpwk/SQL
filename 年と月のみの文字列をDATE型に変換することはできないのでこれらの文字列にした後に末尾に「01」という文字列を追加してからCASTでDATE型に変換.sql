/* 
[����N��]�Ɂu0�v���܂܂�Ă���ꍇ��z��
CASE�����g�p����[����N��]���u0�v�̏ꍇ�ɂ�NULL��Ԃ��A
[����N��]������ȊO�̏ꍇ�ɕ�����̖����Ɂu01�v��ǉ�����DATE�^�ɂ���
*/

SELECT
  [����N��]
  ,CASE
     WHEN [����N��] =0 THEN NULL
	 ELSE CAST(CAST(NULLIF([����N��],0) AS VARCHAR) +'01' AS date)
   END AS [����N��_DATE�^_CASE]
  ,CAST(NULLIF([����N��],0) AS VARCHAR)+'01' AS  [����N��_������^_NULLIF]
  ,COUNT(*) AS [�f�[�^����]
FROM 
  [dbo].[talbe�܂Ƃ�]
GROUP BY
  [����N��]