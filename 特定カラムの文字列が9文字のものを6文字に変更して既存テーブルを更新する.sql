-- 特定カラムの文字列が9文字のものを6文字に変更して既存テーブルを更新する

UPDATE [dbo].[C_1704]
SET [コード] =SUBSTRING([コード], 1, 6) 
WHERE len([コード])=9

/* 参考:https://stackoverflow.com/questions/18570965/update-substring-of-a-column */