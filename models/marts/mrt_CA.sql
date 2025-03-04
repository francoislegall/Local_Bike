select
 order_date as date,
 extract(year from order_date)as year,
 extract(month from order_date) as month,
 product_name,
 store_name,
 sum(CA_wo_discount) as CA_wo_discount,
 sum(discount) as discount,
 sum(CA) as CA
from {{ref("int_CA")}}
 group by 1,2,3,4,5