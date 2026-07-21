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
    departure_airport as departure_airport_id,
    arrival_airport,
    status,
    aircraft_code,
    actual_departure,
    actual_arrival,
    case 
      when actual_departure is not null and actual_arrival is not null
        then actual_arrival - actual_departure
      when actual_departure is null and actual_arrival is null  
        then interval '0 seconds'
      else null
    end as actual_duration_flight
from {{ ref('stg_flights__flights') }}