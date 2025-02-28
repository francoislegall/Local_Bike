with products as (
    
    select
        cast(products_id as string) as products_id,
        product_name,
        cast(brand_id as string) as brand_id,
        cast(category_id as string) as category_id,
        model_year,
        list_price
    from {{source("local_bike","products")}}
)

select * from products
