-- [�t���O]�J�������uBSPL�v����[�R�[�h]�J�����̕�����1�����ڂ��A���t�@�x�b�g�̃��R�[�h��[���z]�J�����̒l�����v�����J�������쐬
-- �Q�l�Fhttps://qiita.com/hisaitami/items/2ede408806088e634eed
SELECT 
  [���Z��]
  ,SUM(CASE WHEN [�t���O]='BSPL' AND  SUBSTRING([�R�[�h], 1, 1) like '[A-Za-z]'  THEN [���z] ELSE 0 END) AS [PL���v]
FROM
  [�������\]
GROUP BY
  [���Z��]
;