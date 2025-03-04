-- - Evolution du CA pour chaque magasin
-- Dimensions:
-- . order_date (table orders)
-- . store_id (table stores)
-- . product_id (table products)

-- Métriques:
-- . CA
-- 	. quantity (table order_items)
-- 	. list price (table order_items)
-- 	. dicount (table order_items)
with
    CA as (

select
 orders.order_id,
 orders.order_date,
 products.product_id,
 products.product_name,
 stores.store_name,
 sum(order_items.quantity) as quantity,
 sum(order_items.list_price) as list_price,
 sum(order_items.discount) as discount,
 sum(order_items.quantity) * sum(order_items.list_price) as CA_wo_discount
from {{ref("stg_orders")}} as orders
left join {{ref("stg_stores")}} as stores on orders.store_id = stores.store_id
left join {{ref("stg_order_items")}} as order_items on orders.order_id = order_items.order_id
left join {{ref("stg_products")}} as products on order_items.product_id = products.product_id
 group by 1,2,3,4,5
 order by 1 asc
),

CA_discount as (
select
 order_date,
 product_name,
 store_name,
 sum(CA_wo_discount) as CA_wo_discount,
 sum(discount) as discount,
 sum(CA_wo_discount) - sum(CA_wo_discount) * sum(discount) as CA
from CA
 group by 1,2,3
 order by order_date asc
)

select * from CA_discount


