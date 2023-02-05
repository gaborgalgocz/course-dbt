with base as (
    select 
        count(distinct session_id) as unique_sessions,
        count(distinct (case when add_to_cart = 1 then session_id end)) as sessions_with_add_to_cart,
        count(distinct (case when checkout = 1 then session_id end)) as sessions_with_checkout
    from {{ ref('int_session_events') }}
)

select 
    round(div0(sessions_with_add_to_cart, unique_sessions) * 100, 1) ||'%' as add_to_cart_rate,
    round(div0(sessions_with_checkout, unique_sessions) * 100, 1) ||'%' as conversion_rate
from base

