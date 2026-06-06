select 
    status,
    count(*)
from {{ ref('stg_flights__flights') }}
group by status