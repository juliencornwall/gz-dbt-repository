

SELECT
date_date,
COUNT(orders_id) AS nb_of_transactions,
ROUND(SUM(revenue), 2) AS revenue,
ROUND(SUM(revenue)/COUNT(orders_id), 2) AS average_basket,
ROUND(SUM(operational_margin), 2) AS operational_margin,
ROUND(SUM(purchase_cost), 2) AS purchase_cost,
ROUND(SUM(shipping_fee), 2) AS shipping_fees,
ROUND(SUM(logcost), 2) AS logcost,
ROUND(SUM(quantity), 2) AS quantity,
ROUND(SUM(margin), 2) AS margin,
ROUND(SUM(ship_cost), 2) AS ship_cost
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date




