WITH product_sales_join AS 
(
SELECT
products_id,
SUM(revenue) AS revenue,
SUM(quantity) AS quantity,
SUM(quantity * purchase_price) AS purchase_cost
FROM {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
USING (products_id)
GROUP BY products_id
)
SELECT
*
, revenue - purchase_cost AS margin
FROM product_sales_join

