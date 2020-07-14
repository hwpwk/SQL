CASE
    WHEN [進捗率] <= 0 THEN '0%以下'
    WHEN ([進捗率] > 0 AND [進捗率] <= 0.1) THEN '≦10％'
    WHEN ([進捗率] > 0.1 AND [進捗率] <= 0.2) THEN '≦20％'
    WHEN ([進捗率] > 0.2 AND [進捗率] <= 0.3) THEN '≦30％'
    WHEN ([進捗率] > 0.3 AND [進捗率] <= 0.4) THEN '≦40％'
    WHEN ([進捗率] > 0.4 AND [進捗率] <= 0.5) THEN '≦50％'
    WHEN ([進捗率] > 0.5 AND [進捗率] <= 0.6) THEN '≦60％'
    WHEN ([進捗率] > 0.6 AND [進捗率] <= 0.7) THEN '≦70％'
    WHEN ([進捗率] > 0.7 AND [進捗率] <= 0.8) THEN '≦80％'
    WHEN ([進捗率] > 0.8 AND [進捗率] <= 0.9) THEN '≦90％'
    WHEN ([進捗率] > 0.9 AND [進捗率] <= 1.0) THEN '≦100％'
    WHEN [進捗率] > 1.0 THEN '100%>'
END AS [進捗率区分]