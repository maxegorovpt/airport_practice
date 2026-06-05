{{
  config(
    materialized = 'table',
    tag = 'staging'
    )
}}

select 
    passenger_id
from {{ ref('staff') }}