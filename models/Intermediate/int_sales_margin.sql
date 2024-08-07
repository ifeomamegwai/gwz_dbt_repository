select
    date_date,
    orders_id,
    products_id,
    revenue,
    quantity,
    CAST(purchase_price AS FLOAT64) as purchase_price, 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin

from 
    {{ ref('stg_raw__sales') }} as s
JOIN 
    {{ ref('stg_raw__product') }} as p
USING(products_id)