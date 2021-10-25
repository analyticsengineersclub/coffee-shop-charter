with orders as (
    select * from {{ref('fct_orders')}}
),

    products as (
    select * from {{ref('dim_products')}}
),

    order_items as (
    select * from {{ref('fct_order_items')}}
),

    product_prices as (
    select * from {{ref('dim_product_prices')}}
),

    customers as (
    select * from {{ref('dim_customers')}}
    )

select 
    orders.created_at as order_date,
    orders.customer_id,
    order_items.order_id,
    order_items.product_id,
    customers.name as customer_name,
    customers.email as customer_email,
    products.name as product_name,
    products.category as product_category,
    product_prices.price as product_price
from order_items 
left join orders on order_items.order_id = orders.id
left join customers on customers.id = orders.customer_id
left join products on order_items.product_id = products.id
left join product_prices on order_items.product_id = product_prices.product_id
    and order.created_at between product_prices.created_at and product_prices.ended_at
