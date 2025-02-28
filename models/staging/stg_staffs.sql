with staffs as (
    
    select
        cast(staff_id as string) as staff_id,
        first name,
        last_name,
        email,
        phone,
        active,
        cast(store_id as string) as store_id,
        manager_id
    from {{source("local_bike","staffs")}}
)

select * from staffs
