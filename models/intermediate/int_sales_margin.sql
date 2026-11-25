

select 
    sales.*,
    prod.purchase_price,
    sales.quantity*prod.purchase_price as purchase_cost,
    ROUND(sales.revenue - (sales.quantity*prod.purchase_price),2) as margin
from {{ ref('stg_raw__sales')}} as sales
left join {{ ref("stg_raw__product")}} as prod
on sales.products_id = prod.products_id