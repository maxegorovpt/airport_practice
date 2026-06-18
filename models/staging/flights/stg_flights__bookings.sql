{{
  config(
    materialized = 'table',
    tag = 'staging'
    )
}}

select
  {{- show_columns_relation('stg_flights__bookings') -}}
from {{ source('demo_src', 'bookings') }}
    