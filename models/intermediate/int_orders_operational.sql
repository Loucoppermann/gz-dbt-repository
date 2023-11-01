select orders.orders_id, 
    date_date,
    round((margin+shipping_fee-logcost-cast(ship_cost as float64)),2) as operational_margin,
    margin,
    shipping_fee,
    logcost,
    cast(ship_cost as float64) as ship_cost,
    revenue,
    purchase_cost
from {{ref("int_orders_margin")}} as orders
left join {{ref("stg_raw__ship")}} as ship
on orders.orders_id=ship.orders_id