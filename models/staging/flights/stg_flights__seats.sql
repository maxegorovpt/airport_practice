{{
  config(
    materialized = 'table',
    tag = 'staging'
    )
}}

select
  aircraft_code,
  seat_no,
  fare_conditions,
  1 as stat_col
from {{ source('demo_src', 'seats') }}
    