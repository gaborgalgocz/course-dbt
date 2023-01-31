## Part 5: Snapshots
Which orders changed from week 1 to week 2?

```sql
select 
    * 
from 
    orders_snapshot 
where 
    dbt_valid_to > '2023-01-22T15:29:39.715Z';
``` 
> The following orders have changed: <br /> 
29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6, <br />
c0873253-7827-4831-aa92-19c38372e58d,<br />
e2729b7d-e313-4a6f-9444-f7f65ae8db9a<br />