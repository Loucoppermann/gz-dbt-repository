select date_date,
    orders_id,
    quantity,
    revenue,
    purchase_price,
    products_id,
    ROUND(quantity*cast(purchase_price as float64), 2) AS purchase_cost,
    ROUND(revenue-quantity*cast(purchase_price as float64), 2) AS margin,
    {{create_margin_percent('revenue', 'ROUND(quantity*cast(purchase_price as float64), 2)')}} as margin_percent
from {{ref ('stg_raw__sales')}} as sales
left join {{ref('stg_raw__product')}} as product
on sales.pdt_id=product.products_id