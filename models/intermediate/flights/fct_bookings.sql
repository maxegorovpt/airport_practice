{{
  config(
    materialized = 'table',
    meta = {
      'owner': 'egorovmaxkrd@gmail.com',
      'created_year': 2026
    },
    tags = ['intermediate']
  )
}}

select 
  book_ref,
  book_date,
  total_amount,
  {{ dbt_utils.generate_surrogate_key(['book_ref']) }} as booking_hk
from {{ ref('stg_flights__bookings') }}