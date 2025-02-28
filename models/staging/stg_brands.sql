with brands as (
    
    select
        cast(brand_id as string) as brand_id,
        brand_name
    from {{source("local_bike","brands")}}
)

select * from brands
