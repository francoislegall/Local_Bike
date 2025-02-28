with stocks as (
    
    select
        concat(store_id,'_',product_id) as store_id__product_id,
        cast(store_id as string) as store_id,
        cast(product_id as string) as product_id,
        quantity
    from {{source("local_bike","stocks")}}
)

select * from stocks
