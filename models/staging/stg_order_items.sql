with order_items as (
    
    select
        cast(concat(order_id,"_",item_id) as string) as order_id__item_id,
        cast(order_id as string) as order_id,
        cast(item_id as string) as item_id,
        cast(product_id as string) as product_id,
        quantity,
        list_price,
        discount
    from {{source("local_bike","order_items")}}
)

select * from order_items