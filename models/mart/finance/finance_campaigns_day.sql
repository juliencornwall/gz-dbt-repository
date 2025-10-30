--Join the int_campaigns_day model with finance_daysmodel from the previous unit

SELECT
  date_date,
  operational_margin - ads_cost AS ad_margin,
  average_basket,
  operational_margin,
  ads_cost,
  impressions AS ads_impression,
  clicks AS ads_clicks,
  quantity,
  revenue,
  purchase_cost,
  margin,
  shipping_fees,
  logcost,
  ship_cost
FROM {{ ref('int_campaigns_day') }}
LEFT JOIN {{ ref('finance_days') }}
USING (date_date)
ORDER BY date_date DESC
