select campaign.date_date,
    ROUND(SUM (operational_margin-ads_cost),2) as ads_margin,
    COUNT (number_transactions) as number_transactions,
    ROUND(SUM (revenue),2) as revenue,
    ROUND(SUM(average_basket),2) as average_basket,
    ROUND(SUM (margin),2) as margin,
    ROUND(SUM (operational_margin),2) as operational_margin, 
    ROUND(SUM(shipping_fee),2) AS shipping_fee, 
    ROUND(SUM(logcost),2) AS logcost, 
    ROUND(SUM(ship_cost),2) AS ship_cost ,
    ROUND(SUM(purchase_cost),2) as purchase_cost
from {{ref("int_campaigns_day")}} as campaign
left join {{ref("finance_days")}} as finance
on campaign.date_date=finance.date_date
GROUP BY date_date
ORDER BY date_date DESC
