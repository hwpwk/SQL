
/*
大文字、小文字を区別して各単語の金額合計を算出

下記、データベースのデフォルトの照合順序を確認して「Japanese_CI_AS」と表示されれば大文字、小文字は区別せずに集計してしまう
SELECT SERVERPROPERTY('collation')
大文字、小文字を区別して集計するにはCOLLATE 句を使用する必要がある

CI
大文字、小文字を区別しない。全角アルファベットの大文字、小文字も区別しない
CS
大文字、小文字を区別する。全角アルファベットの大文字、小文字も区別する
AI
アクセント、濁音、破裂音を区別しない。
AS
アクセント、濁音、破裂音を区別する。
KS
ひらがなとカタカナを区別する。半角でも区別する。
WS
文字幅を区別する。つまり全角、半角を区別する。


参考URL(「sqlserver select 照合順序 指定」で検索)
https://qa.atmarkit.co.jp/q/439
https://culage.hatenablog.com/entry/20170831/1504105200
https://www.projectgroup.info/tips/SQLServer/MSSQL_00000005.html
https://webcache.googleusercontent.com/search?q=cache:Czd207-TJYEJ:https://nonbiri-dotnet.blogspot.com/2017/02/sqlgroupby.html+&cd=5&hl=ja&ct=clnk&gl=jp

*/

USE [database_name]
GO

SELECT SERVERPROPERTY('collation')
--→Japanese_CI_AS

SELECT 
    [単位] COLLATE Japanese_CS_AS_KS_WS AS [単位]
    ,SUM([金額]) AS [金額合計]
FROM 
    [dbo].[まとめ_20180401]
GROUP BY
    [単位] COLLATE Japanese_CS_AS_KS_WS
ORDER BY  
    [金額合計] DESC

