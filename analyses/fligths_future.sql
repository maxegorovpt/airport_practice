select 
    date(scheduled_departure) as date,
    count(*)
from 
{{ ref('fct_flights') }}
where 
    1=1
    and date(scheduled_departure) >= date('{{ run_started_at|string|truncate(10, True, "") }}')
group by date(scheduled_departure)