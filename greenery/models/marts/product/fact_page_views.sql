select 
    e.event_id,
    e.session_id,
    e.user_id,
    e.page_url,
    e.created_at,
    e.product_id,
    p.name,
    p.price,
    p.inventory
from {{ ref( 'stg_postgres_events') }} e 
    left join {{ ref( 'stg_postgres_products') }} p using(product_id)
where event_type = 'page_view'