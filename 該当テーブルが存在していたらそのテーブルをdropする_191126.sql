-- 該当テーブルが存在していたらそのテーブルをdropする
-- SQL Server Management Studio 17 上ではGO がなくても実行される
IF (OBJECT_ID('[dbo].[テーブル1]') IS NOT NULL)
    DROP table [dbo].[テーブル1]



