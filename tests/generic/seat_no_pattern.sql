{% test seat_no_pattern(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} !~ '^[0-9]+[A-Z]$'
{% endtest %}