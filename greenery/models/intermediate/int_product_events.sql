with products as (
    select * from {{ ref('stg_postgres_products')}}
),

events as (
    select * from {{ ref('stg_postgres_events')}}
) 


select 
    p.product_id,
    p.name,
    p.price,
    p.inventory, 
    count(distinct e.event_id) as total_events,
    count(distinct e.session_id) as total_sessions
from products p 
join events e using(product_id)
group by 1,2,3,4