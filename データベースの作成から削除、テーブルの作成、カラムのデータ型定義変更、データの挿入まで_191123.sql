-- 1. �f�[�^�x�[�X���쐬
CREATE DATABASE [C10000_database]
CREATE DATABASE [C20000_database]


-- 1.1 �f�[�^�x�[�X�̍폜
DROP DATABASE [table1]
DROP DATABASE [table2]


-- 2. �g�p����f�[�^�x�[�X�̎w��
-- 3. �e�[�u���̍쐬
USE [C10000_database]
CREATE TABLE [fille_1703] (
   [���Z��] DATE NOT NULL,
   [�ȖڃR�[�h] NVARCHAR NOT NULL,
   [���z] NUMERIC NOT NULL
   )

-- 3.1. �J�����̃f�[�^�^�̕������E�����Ȃǂ̒�`��ύX
ALTER TABLE [fille_1703]
ALTER COLUMN [�ȖڃR�[�h] NVARCHAR(10)

ALTER TABLE [fille_1703]
ALTER COLUMN	 [���z] NUMERIC(25)

-- 4. �e�[�u���Ƀf�[�^��}��
INSERT INTO 
  [fille_1703]([���Z��], [�ȖڃR�[�h], [���z]) 
VALUES
  ('2017-03-31', '10001', 1000),
  ('2017-03-31', '10002', 2000),
  ('2017-03-31', '10003', 3000),
  ('2017-03-31', '10002', 4000),
  ('2017-03-31', '10001', 5000)

-- �쐬�����e�[�u���̊m�F
SELECT * FROM [C10000_database].dbo.[fille_1703]
