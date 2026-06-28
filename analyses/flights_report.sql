{% set status_values = dbt_utils.get_column_values(
    table=ref('fct_flights'),
    column = 'status'
)%}

select
    departure_airport, 
    {% for value in status_values %}
        sum(case when status = '{{ val }}' then 1 else 0 end) as {{ dbt_utils.slugify(value)}}
        {% if not loop['last'] %}, {% endif %}
    {% endfor %}
from {{ ref('fct_flights') }}
GROUP BY departure_airport