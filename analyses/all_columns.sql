-- depends_on: {{ ref('stg_flights__flights') }}

{% if execute %}
  {% set relation = ref('stg_flights__flights') %}

  SELECT 
    {% for column in adapter.get_columns_in_relation(relation) -%}
      'Column: {{ column.name }}' AS col_{{ loop.index }}{{ "," if not loop.last }}
    {% endfor %}

{% endif %}


