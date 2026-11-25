select
orders_id,
date_date,
ROUND(sum(revenue),2) as revenue,
sum(quantity) as quantity,
ROUND(sum(purchase_cost),2) as purchase_cost,
ROUND(sum(margin),2) as margin
from {{ ref("int_sales_margin")}}
group by orders_id, date_date