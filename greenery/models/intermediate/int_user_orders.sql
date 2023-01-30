with items as (
  select * from {{ ref('stg_postgres_order_items') }}
),

orders as (
    select * from {{ ref('stg_postgres_orders') }}
) 

select 
    o.user_id,
    count(distinct i.order_id) as orders_placed,
    count(distinct i.product_id) as distinct_products_bought,
    count(distinct i.quantity) as total_products_bought
  from 
    items i
    join orders o using(order_id)
  group by 
    user_id