USE [C10000_database]
GO

IF OBJECT_ID('[dbo].[NULL_TBL]') IS NOT NULL
    DROP TABLE [dbo].[NULL_TBL]

CREATE TABLE [dbo].[NULL_TBL] (

			[day] DATE NOT NULL,
			[check] NVARCHAR NULL
)
GO

INSERT INTO [dbo].[NULL_TBL]

		SELECT
			  [決算日]
			  ,NULL AS [check]
		FROM
			  [dbo].[fille_1703]

GO

SELECT
     [day]
     ,[check]
FROM
     [dbo].[NULL_TBL]
;