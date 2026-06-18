{% macro safe_select(table_name) %}
  
{% if execute %}

{% set all_tables_q %}
    select
        TABLE_NAME
    from 
        {{ target.database }}.INFORMATION_SCHEMA.TABLES as all_tables
    where   
        TABLE_SCHEMA = '{{ target.schema }}'
{% endset %}


{% set all_tables_query_result = run_query(all_tables_q)%}
{% set all_tables = all_tables_query_result.columns[0].values() %}

{% do log("Found the following models:", info=True) %}
{% do log(all_tables | join(', '), info=True) %}


{% set safe_select_query %}
    {% if table_name in all_tables %}
        select * from {{ ref(table_name) }}
    {% else %}
        select null
    {% endif %}
{% endset %}

{% do log(safe_select_query, True) %}
{% do log("Macro has been finished work!", info=True) %}


{% endif %}
{% endmacro %}