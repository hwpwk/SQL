-- �w��f�[�^�x�[�X���ɍ쐬�����e�[�u���̖��̂ƃf�[�^�������擾����
-- �Q�l�Fhttp://jp.innoya.com/board/ViewTip.aspx?menuid=4&idx=330
USE [20018_��ѓ��H]
GO

SELECT
  A.name AS [TableName]
  ,B.rows AS [�f�[�^����]
FROM
  sys.objects AS A
INNER JOIN 
  sys.sysindexes AS B
ON 
  A.object_id = B.id AND B.indid < 2
WHERE
  A.type = 'U'
