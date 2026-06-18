{%- macro show_columns_relation(model_name) %}
{% if execute %}

{% set columns_query %}
    select
        COLUMN_NAME
    from 
        {{ target.database }}.INFORMATION_SCHEMA.COLUMNS 
    where 
        TABLE_SCHEMA = '{{ target.schema }}'  
        AND TABLE_NAME = '{{ model_name }}'
{% endset %}

{% do log(columns_query, True) %}

{% set columns = run_query(columns_query).columns[0].values() %}

    {%- for column in columns -%}
        {{ column }} {% if not loop.last -%}, {% endif %}
    {%- endfor %}

{% endif %}
{% endmacro %}