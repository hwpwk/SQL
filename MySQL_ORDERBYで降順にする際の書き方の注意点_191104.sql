/*ORDER BY num desc　と降順にしたいカラムとdescを同じ行に並べて実行すればエラーになる、descを改行する必要があることに注意*/
USE mydb;
SELECT
  user_id
  ,count(*) as num
FROM
  orders
GROUP BY
  user_id
ORDER BY
  num
desc
;