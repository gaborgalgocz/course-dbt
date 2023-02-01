with products as (
    select * from {{ ref('stg_postgres_products')}}    
)

, events as (
    select * from {{ ref('stg_postgres_events')}}    
)

, order_items as (
    select * from {{ ref('stg_postgres_order_items')}}    
)

, product_views as (
    select 
        product_id
        , count(distinct(session_id)) as product_views
    from events
    where product_id is not null
    group by 1
)

, product_purchases as (
    select 
        order_items.product_id
        , count(distinct(events.session_id)) as product_purchase_sessions
from events
inner join order_items using (order_id)
group by 1
)

select 
    products.name as product_name
    , product_views
    , product_purchase_sessions
    , round(div0(product_purchase_sessions, product_views) * 100, 0)  || '%' as product_conversion_rate
from products
inner join product_views using(product_id)
inner join product_purchases using(product_id)
order by product_name