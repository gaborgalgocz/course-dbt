{{ config(materialized='table') }}

with postgres_events as (
    select * from {{ ref( 'stg_postgres_events') }}
),

postgres_products as (
    select * from {{ ref( 'stg_postgres_products') }}
)

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
from postgres_events e 
    left join postgres_products p using(product_id)
where event_type = 'page_view'