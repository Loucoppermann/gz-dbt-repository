
select date_date,
    COUNT (orders_id) as number_transactions,
    ROUND(SUM (revenue),2) as revenue,
    ROUND(SAFE_DIVIDE(SUM (revenue),COUNT(orders_id)),2) as average_basket,
    ROUND(SUM (margin),2) as margin,
    ROUND(SUM (operational_margin),2) as operational_margin, 
    ROUND(SUM(shipping_fee),2) AS shipping_fee, 
    ROUND(SUM(logcost),2) AS logcost, 
    ROUND(SUM(ship_cost),2) AS ship_cost,
    ROUND(SUM(purchase_cost),2) AS purchase_cost
from {{ref("int_orders_operational")}}
GROUP BY date_date