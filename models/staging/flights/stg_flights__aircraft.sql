{{
      config(
        materialized = 'table',
        tag = 'staging'
    )
}}
select 
    aircraft_code,
    model,
    "range"
from
    {{ source('demo_src', 'aircrafts') }}