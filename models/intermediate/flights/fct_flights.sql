{{
  config(
    materialized = 'table',
    tags = ['intermediate']
  )
}}

{% set status_values = dbt_utils.get_column_values(
    table = ref('stg_flights__flights'),
    column = 'status'
) %}

{{ log("Unique flight statuses: " ~ status_values, info=True) }}

select 
    flight_id,
    flight_no,
    scheduled_departure,
    scheduled_arrival,
    departure_airport,
    arrival_airport,
    status,
    aircraft_code,
    actual_departure,
    actual_arrival
from {{ ref('stg_flights__flights') }}