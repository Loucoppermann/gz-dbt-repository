select quantity,
    revenue,
    purchase_price,
    products_id,
    ROUND(quantity*cast(purchase_price as float64), 2) AS purchase_cost,
    ROUND(revenue-quantity*cast(purchase_price as float64), 2) AS margin
from {{ref ('stg_raw__sales')}} as sales
left join {{ref('stg_raw__product')}} as product
on sales.product_id=product.products_id