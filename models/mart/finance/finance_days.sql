
select date_date,
    COUNT (orders_id) as number_transactions,
    ROUND(SUM (revenue),2) as revenue,
    ROUND(SAFE_DIVIDE(SUM (revenue),COUNT(orders_id)),2) as average_basket,
    ROUND(SUM (margin),2) as margin,
    ROUND(SUM (operational_margin),2) as operational_margin
from {{ref("int_orders_operational")}}
GROUP BY date_date