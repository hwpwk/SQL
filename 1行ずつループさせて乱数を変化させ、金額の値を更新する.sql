-- ループ処理用のカラムを作成しておく
INSERT INTO tmp_tbl
	SELECT
                    [決算日]
	      ,[金額]
                    ,ROW_NUMBER() OVER (ORDER BY [決算日],[会社コード],[勘定科目コード],[BSPL/CF]) AS [行]
	FROM
                     tbl
GO

-- 金額のマスク処理
-- 1行ずつループさせて乱数を変化させ、金額の値を更新する
DECLARE @cnt INT
DECLARE @nrows INT
SET @cnt=1
SELECT @nrows = COUNT(*) FROM tmp_tbl

WHILE @cnt <= @nrows
　　BEGIN
	UPDATE tmp_tbl
	SET [金額] = [金額]*(1.2+(0.001*RAND()-0.001*RAND()))
	WHERE [行] = @cnt
　　SET @cnt = @cnt + 1
END

GO