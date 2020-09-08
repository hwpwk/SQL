IF (OBJECT_ID('[ana].[View_tbl]') IS NOT NULL)
    DROP VIEW [ana].[View_tbl]
GO

CREATE VIEW [ana].[View_tbl] AS

  SELECT
      *
  FROM
     tmp

GO