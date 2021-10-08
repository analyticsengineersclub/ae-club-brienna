with customers as (
    SELECT 
        * 
    FROM 
        analytics-engineers-club.coffee_shop.customers
),

orders as (
    SELECT 
        *
    FROM 
        analytics-engineers-club.coffee_shop.orders
),

customers_orders as (
    SELECT 
        orders.*, 
        orders.id as order_id, 
        customers.*
    FROM 
        customers 
    LEFT JOIN orders on customers.id = orders.customer_id
)

select 
    customer_id, 
    name, 
    email, 
    min(created_at) AS first_order_at,
    count(distinct order_id) AS number_of_orders
from customers_orders 
group by 1, 2, 3
order by 4
limit 5;