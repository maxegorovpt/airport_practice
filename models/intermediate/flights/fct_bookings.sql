{{
  config(
    materialized = 'table',
    meta = {
      'owner':'egorovmaxkrd@gmail.com',
      'created_year': 2026},
      tag = 'intermediate'
    )
}}

select 
  book_ref,
  book_date,
  total_amount
from {{ ref('stg_flights__bookings') }}