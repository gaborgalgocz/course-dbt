select 
    o.user_id,
    count(distinct i.order_id) as orders_placed,
    count(distinct i.product_id) as distinct_products_bought,
    count(distinct i.quantity) as total_products_bought
  from 
    {{ ref('stg_postgres_order_items') }} i
    join {{ ref('stg_postgres_orders') }} o using(order_id)
  group by 
    user_id