{{ config(materialized='table') }}

with postgres_orders as (
    select * from {{ref('stg_postgres_orders')}}
),

items_per_order as (
    select 
        order_id,
        count(quantity) as number_of_items_ordered
    from 
        {{ref('stg_postgres_order_items')}}
    group by
      order_id
)

select 
    o.order_id, 
    o.user_id, 
    o.promo_id, 
    o.address_id, 
    o.created_at, 
    o.order_cost, 
    o.shipping_cost, 
    o.order_total, 
    o.tracking_id, 
    o.shipping_service, 
    o.estimated_delivery_at, 
    o.delivered_at, 
    o.status,
    i.number_of_items_ordered,
    datediff('hour',o.created_at,o.delivered_at) as hours_till_delivery
from 
    postgres_orders o
    left join items_per_order i using(order_id)