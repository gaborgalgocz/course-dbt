{{ config(materialized='table') }}

select
    user_id,
    session_id
    {{ aggregate_event_types() }}
from {{ ref('stg_postgres__events')}}
group by 1, 2