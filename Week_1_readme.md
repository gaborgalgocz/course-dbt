# Week 1 questions  

How many users do we have?  

```sql
select
    count(distinct user_id) as total_users
from
    stg_orders
```  

> We have 124 users.  

On average, how many orders do we receive per hour?  

```sql
with orders_per_hour as (
        select
            date_trunc('hour', created_at) as hour,
            count(distinct order_id) as orders_total
        from
            stg_orders
        group by
            hour
    )
select
    avg(orders_total)
from
    orders_per_hour
```  

> On average we receive 7.52 orders per hour.  

On average, how long does an order take from being placed to being delivered?  

```sql
select
    avg(datediff('hour', created_at, delivered_at)) as avg_delivery_time
from
    stg_orders
```  

> On average, it takes 93.4 hours for an order to being delivered.  

How many users have only made one purchase? Two purchases? Three+ purchases?  

```sql
with purchases as (
        select
            user_id,
            count(order_id) as num_orders
        from
            stg_orders
        group by
            1
    )
select
    case
        when num_orders > 2 then '3 or more'
        else num_orders::string
    end as num_orders_bins,
    count(user_id) as num_users
from
    purchases
group by
    1
order by
    1 asc
```  

> We have 25 users with 1 order, 28 users with 2 orders and 71 users with 3 orders or more.   

On average, how many unique sessions do we have per hour?  

```sql
with sessions_per_hour as (
        select
            date_trunc('hour', created_at) as session_hour,
            count(distinct session_id) as num_sessions
        from
            stg_events
        group by
            1
    )
select
    round(avg(num_sessions), 2) as avg_sessions_per_hour
from
    sessions_per_hour
```  

> On average we have 16.33 sessions per hour.