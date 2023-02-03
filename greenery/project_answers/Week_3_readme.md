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
<br /><br />

What is our conversion rate by product?
<br />
I've looked at other people's results and I've seen some differences, I think my results are not correct, maybe something to do with sessions but I haven't figured it out yet.
```sql
select *
from product_conversion_rates;
```

| PRODUCT_NAME | PRODUCT_VIEWS | PRODUCT_PURCHASE_SESSIONS | PRODUCT_CONVERSION_RATE |
|--------------|---------------|---------------------------|-------------------------|
| Alocasia Polly | 51 | 21 | 41% |
| Aloe Vera | 65 | 32 | 49% |
| Angel Wings Begonia | 61 | 24 | 39% |
| Arrow Head | 63 | 35 | 56% |
| Bamboo | 67 | 36 | 54% |
| Bird of Paradise | 60 | 27 | 45% |
| Birds Nest Fern | 78 | 33 | 42% |
| Boston Fern | 63 | 26 | 41% |
| Cactus | 55 | 30 | 55% |
| Calathea Makoyana | 53 | 27 | 51% |
| Devil's Ivy | 45 | 22 | 49% |
| Dragon Tree | 62 | 29 | 47% |
| Ficus | 68 | 29 | 43% |
| Fiddle Leaf Fig | 56 | 28 | 50% |
| Jade Plant | 46 | 22 | 48% |
| Majesty Palm | 67 | 33 | 49% |
| Money Tree | 56 | 26 | 46% |
| Monstera | 49 | 25 | 51% |
| Orchid | 75 | 34 | 45% |
| Peace Lily | 66 | 27 | 41% |
| Philodendron | 62 | 30 | 48% |
| Pilea Peperomioides | 59 | 28 | 47% |
| Pink Anthurium | 74 | 31 | 42% |
| Ponytail Palm | 70 | 28 | 40% |
| Pothos | 61 | 21 | 34% |
| Rubber Plant | 54 | 28 | 52% |
| Snake Plant | 73 | 29 | 40% |
| Spider Plant | 59 | 28 | 47% |
| String of pearls | 64 | 39 | 61% |
| ZZ Plant | 63 | 34 | 54% |

## Part 2: Macros
I've used a few basic macros, one is aggregating event types per session that I've used in a new model "int_session_events_macro.sql".

## Part 3: Post hooks
I've added the grant macro and the post hook that has successfully run.

## Part 4: Packages
I've added dbt-utils, dbt-expectations and codegen. I've used dbt-expectations to test for the number of columns in all sources so I can find out if upstream schema changes add new columns to the source. I've also used the get_column_values macro from dbt-utils and used codegen to generate models.yml. 

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