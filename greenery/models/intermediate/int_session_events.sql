{{ config(materialized='table') }}

select
    user_id,
    session_id
    {{ aggregate_event_types() }}
from {{ ref('stg_postgres_events')}}
group by 1, 2