{% set current_date = '{{ run_started_at|string|truncate(10, True, "") }}' %}
select 
    count(*)
from {{ ref('fct_flights') }} 
where 
    1=1
    and date(scheduled_departure) between 
    (current_date - interval '10 years') and date(current_date)