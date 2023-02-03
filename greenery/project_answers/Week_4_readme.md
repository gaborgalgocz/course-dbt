## Part 1: Snapshots
Which orders changed from week 3 to week 4?

```sql
select 
    * 
from 
    orders_snapshot 
where 
    dbt_valid_to > '2023-02-02';
``` 
> The following orders have changed: <br /> 

| ORDER_ID          |
| ----------------- |
| 0e9b8ee9-ad0a-42f4-a778-e1dd3e6f6c51 |
| 841074bf-571a-43a6-963c-ba7cbdb26c85 |
| df91aa85-bfc7-4c31-93ef-4cee8d00a343 |
