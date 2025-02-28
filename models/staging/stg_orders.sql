with orders as (
    
    select
        cast(order_id as string) as order_id,
        cast(customer_id as string) as customer_id,
        cast(order_status as string) as order_status,
        order_date,
        required_date,
        case when shipped_date ='NULL' then null else shipped_date end as shipped_date,
        cast(store_id as string) as store_id,
        cast(staff_id as string) as staff_id
    from {{source("local_bike","orders")}}
)

select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    cast(shipped_date as date) as shipped_date,
    store_id,
    staff_id
from orders