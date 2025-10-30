--Write the query and build the model. The model should create a table with the following columns:
--datemonth
--ads_margin
--average_basket
--operational_margin
--ads_cost
--ads_impression
--ads_clicks
--quantity
--revenue
--purchase_cost
--margin
--shipping_fee
--log_cost
--ship_cost

SELECT
  DATE_TRUNC(date_date, MONTH) AS datemonth,
  SUM(ad_margin) AS ad_margin,
  AVG(average_basket) AS average_basket,
  SUM(operational_margin) AS operational_margin,
  SUM(ads_cost) AS ads_cost,
  SUM(ads_impression) AS ads_impression,
  SUM(ads_clicks) AS ads_clicks,
  SUM(quantity) AS quantity,
  SUM(revenue) AS revenue,
  SUM(purchase_cost) AS purchase_cost,
  SUM(margin) AS margin,
  SUM(shipping_fees) AS shipping_fee,
  SUM(logcost) AS logcost,
  SUM(ship_cost) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY
  DATE_TRUNC(date_date, MONTH)
ORDER BY
  datemonth DESC