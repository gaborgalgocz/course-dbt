with postgres_users as (
  select * from {{ref('stg_postgres_users')}}
),

user_orders as (
  select * from {{ref('int_user_orders')}}
)

select 
  u.user_id, 
  u.first_name, 
  u.last_name, 
  u.email, 
  u.phone_number, 
  u.created_at, 
  u.updated_at, 
  u.address_id,
  o.orders_placed,
  o.distinct_products_bought,
  o.total_products_bought
from 
  postgres_users u
  left join user_orders o using(user_id)