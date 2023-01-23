select 
    e.event_guid,
    e.session_guid,
    e.user_guid,
    e.page_url,
    e.created_at_utc,
    e.product_guid,
    p.product_name,
    p.price,
    p.inventory_count
from {{ ref( 'stg_postgres_events') }} e 
    left join {{ ref( 'stg_postgres_products') }} p using product_guid
where event_type = 'page_view'