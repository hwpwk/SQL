-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- ���p�N���ɂ�����x�����z�̑傫���̑��l���ʐ��A�����l�A��O�l���ʐ����擾����
--PERCENTILE_CONT �ł̓f�[�^�Z�b�g�ɑ��݂��邩�ǂ����Ɋ֌W�Ȃ��K�؂Ȓl���}������APERCENTILE_DISC �ł͏�ɃZ�b�g������ۂ̒l��Ԃ��B
-- �Q�l�Fhttps://docs.microsoft.com/ja-jp/sql/t-sql/functions/percentile-cont-transact-sql?view=sql-server-ver15
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
SELECT DISTINCT 
      [���p�N��]
      ,PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS First_Quartile_C
	  ,PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS First_Quartile_D
	  ,PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Median_Quartile_C
	  ,PERCENTILE_DISC(0.50) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Median_Quartile_D
	  ,PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Third_Quartile_C
	  ,PERCENTILE_DISC(0.75) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Third_Quartile_D
	  ,PERCENTILE_CONT(1.00) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Third_Quartile_C
	  ,PERCENTILE_DISC(1.00) WITHIN GROUP (ORDER BY [�x�����z]) OVER (PARTITION BY [���p�N��]) AS Third_Quartile_D
FROM
�@�@[FeeForUsingCreditCard2].[ana].[VIEW_CreditCard_IdentityVarification]