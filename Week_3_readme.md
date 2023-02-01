## Part 1: Conversion rates
What is our overall conversion rate?
```sql
select 
    div0(sum(checkout), 
    count(distinct session_id)) as conversion_rate
from 
    fact_conversion_rate;
```
Our overall conversion rate is 62.5%
<br />
What is our conversion rate by product?



## Part 5: Snapshots
Which orders changed from week 1 to week 2?

```sql
select 
    * 
from 
    orders_snapshot 
where 
    dbt_valid_to > '2023-01-23';
``` 
> The following orders have changed: <br /> 
29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6, <br />
c0873253-7827-4831-aa92-19c38372e58d,<br />
e2729b7d-e313-4a6f-9444-f7f65ae8db9a<br />