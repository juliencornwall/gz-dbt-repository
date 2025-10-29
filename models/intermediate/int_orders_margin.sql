WITH product_sales_join AS 
(
SELECT
orders_id,
date_date,
ROUND(SUM(revenue),2) AS revenue,
SUM(quantity) AS quantity,
ROUND(SUM(quantity * purchase_price),2) AS purchase_cost
FROM {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
USING (products_id)
GROUP BY orders_id, date_date
)
SELECT
*
, ROUND((revenue - purchase_cost),2) AS margin
FROM product_sales_join