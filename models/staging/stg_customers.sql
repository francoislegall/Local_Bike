with customers as (
    
    select
        cast(customer_id as string) as customer_id,
        first_name,
        last_name,
        phone,
        email,
        street,
        city,
        state,
        zip_code
    from {{source("local_bike","customers")}}
)

select * from customers
