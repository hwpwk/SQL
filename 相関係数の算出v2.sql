/*
�N���E���p�X�����̎x�����z�̕��ςƔN���E���p�X�����̗��p�񐔂̑��֌W�����Z�o����
*/
USE [FeeForUsingCreditCard2]
GO

IF OBJECT_ID('[ana].[VIEW_BeforeCalcCorrelatoinCoefficient]') IS NOT NULL
   DROP VIEW [ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
GO

CREATE VIEW [ana].[VIEW_BeforeCalcCorrelatoinCoefficient] AS

WITH AddYearMonth AS(
		SELECT
			LEFT([���p��], 4) + SUBSTRING(CAST([���p��] AS NVARCHAR), 6, 2) AS [�N��]
			,[���p��]
			,[���p�X���E���i��] AS [���p�X��]
			,[�x�����z]
		FROM
			[ana].[Table_CreditCard_IdentityVarification]
)--868
-- 1�ڂ̗v�f(�N���E���p�X�����̎x�����z�̕��ϒl)�̎Z�o
, AvgPriceByYearMonthByStore AS(
		SELECT
			[�N��]
			,[���p�X��]
			,AVG([�x�����z]) AS [���ώx�����zBy�N���E���p�X��]
		FROM
			AddYearMonth
		GROUP BY
			[�N��]
			,[���p�X��]
) -- 187
-- 2�ڂ̗v�f(�N���E���p�X�����̗��p��)�̎Z�o
, CntByYearMonthByStore AS(
		SELECT
			[�N��]
			,[���p�X��]
			,COUNT([�x�����z]) AS [���p��By�N���E���p�X��]
		FROM
			AddYearMonth
		GROUP BY
			[�N��]
			,[���p�X��]
) -- 187
-- ���ꂼ��̗v�f���Z�o�����e�[�u�����������A���ꂼ��̗v�f�̕��ϒl�ƕW���΍����擾
-- �W�v�P�ʂŃ��j�[�N�ɂȂ��Ă��邩�m�F���邽�߂�����View�ɐ؂�o��
SELECT
	A.[�N��]
    ,A.[���p�X��]
	,[���ώx�����zBy�N���E���p�X��]
    ,[���p��By�N���E���p�X��]
	-- ���֌W���Z�o�Ɏg�p���镪�q�̕��ϒl�ɂ��Ă͑S���Ԃɂ����镽�ώx�����z�Ɨ��p�񐔂��Z�o
	,AVG([���ώx�����zBy�N���E���p�X��]) OVER(PARTITION BY A.[���p�X��])  AS [���ώx�����zBy���p�X��]
	,AVG([���p��By�N���E���p�X��]) OVER(PARTITION BY  A.[���p�X��]) AS [���ϗ��p��By���p�X��]
	-- ���֌W���������l�̏ꍇ�̊m�F�p�Ƃ��Ă��̎��_�ŕW���΍����Z�o
	-- �����֌W���Z�o�Ɏg�p���镪��̂��ꂼ��̕W���΍���0�ɂȂ��Ă���\������������
	,STDEVP([���ώx�����zBy�N���E���p�X��]) OVER(PARTITION BY A.[���p�X��])  AS [�W���΍��x�����zBy���p�X��]
	,STDEVP([���p��By�N���E���p�X��]) OVER(PARTITION BY  A.[���p�X��]) AS [�W���΍����p��By���p�X��]
FROM
    AvgPriceByYearMonthByStore AS A
LEFT OUTER JOIN
    CntByYearMonthByStore AS C
ON
    A.[�N��] = C.[�N��]
	AND A.[���p�X��] = C.[���p�X��]
GO
;

-- �W�v�P�ʂŃ��j�[�N�ɂȂ��Ă��邩�m�F
SELECT
    COUNT(*) AS [n]
	,COUNT(DISTINCT [�N��] +[���p�X��] ) AS [distinct_n]
FROM
    [FeeForUsingCreditCard2].[ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
;
  

  -- �΍��̎Z�o���瑊�֌W���̎Z�o�܂�
  IF OBJECT_ID('[ana].[VIEW_CalcCorrelatoinCoefficient]') IS NOT NULL
   DROP VIEW [ana].[VIEW_CalcCorrelatoinCoefficient]
GO

CREATE VIEW [ana].[VIEW_CalcCorrelatoinCoefficient] AS
-- �΍��̎Z�o
WITH Diviation AS(
		SELECT
			  [�N��]
			  ,[���p�X��]
			  ,[���ώx�����zBy�N���E���p�X��]
			  ,[���p��By�N���E���p�X��]
			  ,[���ώx�����zBy���p�X��]
			  ,[���ϗ��p��By���p�X��]
			  ,[�W���΍��x�����zBy���p�X��]
			  ,[�W���΍����p��By���p�X��]
			  ,[���ώx�����zBy�N���E���p�X��] - [���ώx�����zBy���p�X��] AS [�΍�_���ώx�����z]
			  ,[���p��By�N���E���p�X��] - [���ϗ��p��By���p�X��] AS [�΍�_���p��]
		FROM 
			  [ana].[VIEW_BeforeCalcCorrelatoinCoefficient]
)
-- ���֌W���̎Z�o
SELECT
      [�N��]
      ,[���p�X��]
      ,[���ώx�����zBy�N���E���p�X��]
      ,[���p��By�N���E���p�X��]
      ,[���ώx�����zBy���p�X��]
      ,[���ϗ��p��By���p�X��]
      ,[�W���΍��x�����zBy���p�X��]
      ,[�W���΍����p��By���p�X��]
	  ,[�΍�_���ώx�����z]
	  ,[�΍�_���p��]
	  -- ���q�ƕ���̏W�v�P�ʂ𑵂���
	  ,AVG([�΍�_���ώx�����z]*[�΍�_���p��]) OVER (PARTITION BY [���p�X��])
	  /NULLIF(
	  STDEVP([���ώx�����zBy�N���E���p�X��]) OVER(PARTITION BY [���p�X��])*STDEVP([���p��By�N���E���p�X��]) OVER(PARTITION BY [���p�X��])
	  , 0) AS [���֌W��_���ώx�����z�Ɨ��p��By���p�X��]
	  -- �m�F�p
	  ,AVG([�΍�_���ώx�����z]*[�΍�_���p��]) OVER (PARTITION BY [���p�X��])
	  /NULLIF(
	  [�W���΍��x�����zBy���p�X��]*[�W���΍����p��By���p�X��]
	  , 0) AS [���֌W��_���ώx�����z�Ɨ��p��By���p�X��_chk]
	  ,COUNT(*) OVER (PARTITION BY [���p�X��]) AS [����By���p�X��]
FROM 
    Diviation
GO
;

-- ���֌W���̒l��-1�ȏ�1�ȉ��ł��邩�ǂ����m�F
SELECT
    MIN([���֌W��_���ώx�����z�Ɨ��p��By���p�X��]) AS [Min���֌W��]
	,MAX([���֌W��_���ώx�����z�Ɨ��p��By���p�X��]) AS [Max���֌W��]
FROM
     [ana].[VIEW_CalcCorrelatoinCoefficient]
;

SELECT
    COUNT(DISTINCT [���p�X��]) AS [cnt���p�X��]
	-- ���֌W���ƌ�����NULL�̏ꍇ��0��⊮���Ă���
	,COUNT(DISTINCT [���p�X��] 
	+ CAST(COALESCE([���֌W��_���ώx�����z�Ɨ��p��By���p�X��], 0) AS NVARCHAR)
	+  CAST(COALESCE([����By���p�X��], 0) AS NVARCHAR)
	) AS [cnt���p�X��+���֌W��+����]

FROM 
        [ana].[VIEW_CalcCorrelatoinCoefficient]
;