{%- macro aggregate_event_types() -%}
{%- 
    set event_types = dbt_utils.get_column_values(
        table = ref('stg_postgres_events')
        , column = 'event_type'
        , order_by = 'event_type asc'
    ) 
-%}
    {% for event_type in event_types -%}
    , sum(case when event_type = '{{ event_type}}' then 1 else 0 end) as {{ event_type }}
    {% endfor -%}
{% endmacro %}