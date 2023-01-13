# Week 1 questions
How many users do we have?
```sql
select
    count(distinct(user_id)) as total_users
from
    stg_orders;
```