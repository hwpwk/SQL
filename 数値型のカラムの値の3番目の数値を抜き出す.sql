-- Select third digit of home phone for each customer with valid home phone number from Tbl_customer table:
select 
  HOME_PHONE_NO,
  substring(cast(HOME_PHONE_NO as nvarchar), 3, 1) as third_digit_of_home_phone
from
  Tbl_customer
;