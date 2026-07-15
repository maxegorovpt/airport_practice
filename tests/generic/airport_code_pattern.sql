{% test airport_code_pattern(model, column_name) %}
select *
from {{ model }}
where {{ column_name }} !~ '^[A-Z]{3}$'
{% endtest %}