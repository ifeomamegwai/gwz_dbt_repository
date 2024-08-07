SELECT 
    date_date,
    COUNT(orders_id) AS number_transactions,
    ROUND(SUM(revenue),0) AS revenue,
    ROUND(AVG(revenue),2) AS average_basket,
    ROUND(SUM(margin),2) AS margin,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    ROUND(SUM(purchase_cost),0) AS purchase_cost, 
    ROUND(SUM(shipping_fee),0) AS shipping_fee, 
    ROUND(SUM(logcost),0) AS logcost, 
    ROUND(SUM(ship_cost),0) AS ship_cost,
    SUM(quantity) AS quantity 
FROM
    {{ ref('int_orders_operational') }}
GROUP BY
    date_date
ORDER BY
    date_date