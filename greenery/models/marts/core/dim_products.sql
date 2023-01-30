with product_events as ( 
    select * from {{ref('int_product_events')}}
)

select 
    product_id,
    name,
    price,
    inventory,
    total_events,
    total_sessions
from product_events