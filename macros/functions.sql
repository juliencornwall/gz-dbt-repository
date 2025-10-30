 --Inside, define the macro margin_percent taking as argument revenue and purchase_cost

{% macro margin_percent(revenue, purchase_cost,precision=2) %}
    ROUND(
        SAFE_DIVIDE(({{ revenue }} - {{ purchase_cost }}), {{ revenue }}) * 100, {{precision}}
    )
{% endmacro %}


