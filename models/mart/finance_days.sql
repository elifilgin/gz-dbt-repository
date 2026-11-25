with orders_per_day as (
select 
date_date,
count(distinct orders_id) as transactions,
ROUND(sum(revenue),0) as revenue,
ROUND(sum(quantity),0) as quantity,
ROUND(sum(margin),0) as margin,
ROUND(sum(purchase_cost),0) as purchase_cost,
ROUND(sum(operational_margin),0) as operational_margin,
ROUND(sum(shipping_fee),0) as shipping_fee,
ROUND(sum(logcost),0) as logcost,
ROUND(sum(ship_cost),2) as ship_cost,
sum(revenue) / nullif(count(distinct orders_id), 0) as average_basket
FROM {{ ref("int_orders_operational")}}
group by date_date


)
select* from orders_per_day