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

## Part 2: Product funnel
I've created a new model 'product_funnel.sql' that calculates the Add to cart rate and the Conversion rate. I haven't created a dashboard in Sigma.

### Product funnel

| ADD_TO_CART_RATE | CONVERSION_RATE |
|-----------------|-----------------|
| 80.8            | 62.5            |

## Part 3: dbt next steps

Our organisation is not using dbt for data modelling yet, just for basic data transformations like cleaning and standardising data formats. We'll need to see what is needed to start using dbt, as we clearly see a lot of benefits of dbt's mature, collaborative workflows. We need to understand how easy it is for junior data analysts to get familiar with dbt models and workflows - I think we'll start with a Proof of concept and we'll go from there. One thing I'm thinking about is how agile this process can be - I'm worried that we need to reach some level of engineering maturity and we need a lot of advance planning, we can't just be "agile" and build whatever model comes to mind first. I think I will continue learning, I might join the Data modelling course at CoRise and I can be more helpful in answering these questions. 