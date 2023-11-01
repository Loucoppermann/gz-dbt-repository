select date_trunc(date_date, month) as date_month,
    ROUND(SUM (ads_margin),2) as ads_margin,
    COUNT (number_transactions) as number_transactions,
    ROUND(SUM (revenue),2) as revenue,
    ROUND(SUM(average_basket),2) as average_basket,
    ROUND(SUM (margin),2) as margin,
    ROUND(SUM (operational_margin),2) as operational_margin, 
    ROUND(SUM(shipping_fee),2) AS shipping_fee, 
    ROUND(SUM(logcost),2) AS logcost, 
    ROUND(SUM(ship_cost),2) AS ship_cost,
    ROUND(SUM(purchase_cost),2) as purchase_cost,
    SUM(quantity) AS quantity
from {{ref("finance_campaigns_day")}}
GROUP BY date_month