with staffs as (
    
    select
        cast(staff_id as string) as staff_id,
        first_name,
        last_name,
        email,
        phone,
        active,
        cast(store_id as string) as store_id,
        case when manager_id ='NULL' then null else manager_id end as manager_id,
    from {{source("local_bike","staffs")}}
)

select * from staffs
