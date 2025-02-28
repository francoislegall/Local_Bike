with stocks as (
    
    select
        cast(store_id as string) as store_id,
        cast(product_id as string) as product_id,
        quantity
    from {{source("local_bike","stocks")}}
)

select * from stocks
