-- 1. データベースを作成
CREATE DATABASE [C10000_database]
CREATE DATABASE [C20000_database]


-- 1.1 データベースの削除
DROP DATABASE [table1]
DROP DATABASE [table2]


-- 2. 使用するデータベースの指定
-- 3. テーブルの作成
USE [C10000_database]
CREATE TABLE [fille_1703] (
   [決算日] DATE NOT NULL,
   [科目コード] NVARCHAR NOT NULL,
   [金額] NUMERIC NOT NULL
   )

-- 3.1. カラムのデータ型の文字数・桁数などの定義を変更
ALTER TABLE [fille_1703]
ALTER COLUMN [科目コード] NVARCHAR(10)

ALTER TABLE [fille_1703]
ALTER COLUMN	 [金額] NUMERIC(25)

-- 4. テーブルにデータを挿入
INSERT INTO 
  [fille_1703]([決算日], [科目コード], [金額]) 
VALUES
  ('2017-03-31', '10001', 1000),
  ('2017-03-31', '10002', 2000),
  ('2017-03-31', '10003', 3000),
  ('2017-03-31', '10002', 4000),
  ('2017-03-31', '10001', 5000)

-- 作成したテーブルの確認
SELECT * FROM [C10000_database].dbo.[fille_1703]
