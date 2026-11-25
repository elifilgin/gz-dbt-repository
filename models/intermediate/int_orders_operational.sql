select
o.orders_id,
o.date_date,
ROUND((o.margin + sh.shipping_fee -(sh.logcost + sh.ship_cost)),2) as operational_margin
from {{ ref('int_orders_margin')}} as o
left join {{ ref('stg_raw__ship')}} as sh 
on sh.orders_id = o.orders_id