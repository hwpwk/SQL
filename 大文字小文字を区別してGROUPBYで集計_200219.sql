
/*
�啶���A����������ʂ��Ċe�P��̋��z���v���Z�o

���L�A�f�[�^�x�[�X�̃f�t�H���g�̏ƍ��������m�F���āuJapanese_CI_AS�v�ƕ\�������Α啶���A�������͋�ʂ����ɏW�v���Ă��܂�
SELECT SERVERPROPERTY('collation')
�啶���A����������ʂ��ďW�v����ɂ�COLLATE ����g�p����K�v������

CI
�啶���A����������ʂ��Ȃ��B�S�p�A���t�@�x�b�g�̑啶���A����������ʂ��Ȃ�
CS
�啶���A����������ʂ���B�S�p�A���t�@�x�b�g�̑啶���A����������ʂ���
AI
�A�N�Z���g�A�����A�j�􉹂���ʂ��Ȃ��B
AS
�A�N�Z���g�A�����A�j�􉹂���ʂ���B
KS
�Ђ炪�ȂƃJ�^�J�i����ʂ���B���p�ł���ʂ���B
WS
����������ʂ���B�܂�S�p�A���p����ʂ���B


�Q�lURL(�usqlserver select �ƍ����� �w��v�Ō���)
https://qa.atmarkit.co.jp/q/439
https://culage.hatenablog.com/entry/20170831/1504105200
https://www.projectgroup.info/tips/SQLServer/MSSQL_00000005.html
https://webcache.googleusercontent.com/search?q=cache:Czd207-TJYEJ:https://nonbiri-dotnet.blogspot.com/2017/02/sqlgroupby.html+&cd=5&hl=ja&ct=clnk&gl=jp

*/

USE [database_name]
GO

SELECT SERVERPROPERTY('collation')
--��Japanese_CI_AS

SELECT 
    [�P��] COLLATE Japanese_CS_AS_KS_WS AS [�P��]
    ,SUM([���z]) AS [���z���v]
FROM 
    [dbo].[�܂Ƃ�_20180401]
GROUP BY
    [�P��] COLLATE Japanese_CS_AS_KS_WS
ORDER BY  
    [���z���v] DESC

