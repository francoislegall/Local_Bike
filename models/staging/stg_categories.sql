with categories as (
    
    select
        cast(category_id as string) as category_id,
        category_name
    from {{source("local_bike","categories")}}
)

select * from categories
