-- �w��f�[�^�x�[�X���ɍ쐬�����e�[�u���̖��̂ƃe�[�u���쐬�����擾����
-- �Q�l�Fhttps://qiita.com/qsuke92/items/51a85a58ac91782ee528
USE [20018_��ѓ��H]
GO

SELECT
  name AS [table_name]
  ,CAST(create_date AS DATE) AS [create_date]
FROM 
  sys.objects
WHERE
  type = 'U'