{{
  config(
    materialized = 'table',
    tag = 'staging'
    )
}}

select 
    city,
    region
from {{ ref('city_region') }}