WITH product_sales_join AS 
(
SELECT
products_id,
orders_id,
date_date,
ROUND(revenue,2) AS revenue,
ROUND(quantity,2) AS quantity,
ROUND(quantity * purchase_price,2) AS purchase_cost
FROM {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
USING (products_id)
)
SELECT
*
, revenue - purchase_cost AS margin
, {{margin_percent('revenue','purchase_cost')}} AS margin_percent
FROM product_sales_join

