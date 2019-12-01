-- クーポン値引き後の売上金額を取得
SELECT
  purchase_id
  ,amount - coupon AS discount_amt1
  -- couponがNULLの場合、0に置き換える
  ,amount - COALESCE(coupon, 0) AS discount_amt2
FROM
  dbo.purchase_log_with_coupon
;