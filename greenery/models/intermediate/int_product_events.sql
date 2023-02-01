with products as (
    select * from {{ ref('stg_postgres_products')}}
),

events as (
    select * from {{ ref('stg_postgres_events')}}
) 

{%- set event_types = dbt_utils.get_column_values(
    table=ref('stg_postgres_events'),
    column='event_type')
    -%}

select 
    p.product_id
    , p.name
    , p.price
    , p.inventory
    {%- for event_type in event_types %}
    , {{ case_agg('event_type', event_type) }} as {{ event_type}}
    {%- endfor %}
    , count(distinct e.event_id) as total_events
    , count(distinct e.session_id) as total_sessions
from products p 
join events e using(product_id)
group by 1,2,3,4
ORDER BY p.name
