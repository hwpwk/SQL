-- �N�[�|���l������̔�����z���擾
SELECT
  purchase_id
  ,amount - coupon AS discount_amt1
  -- coupon��NULL�̏ꍇ�A0�ɒu��������
  ,amount - COALESCE(coupon, 0) AS discount_amt2
FROM
  dbo.purchase_log_with_coupon
;