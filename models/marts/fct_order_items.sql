with orders as (
    select * from {{ref('fct_orders')}}
),

    products as (
    select * from {{ref('dim_products')}}
),

    order_items as (
    select * from {{ref('stg_order_items')}}
),

    product_prices as (
    select * from {{ref('dim_product_prices')}}
)

select 
    orders.created_at as order_date,
    orders.customer_id,
    order_items.order_id,
    order_items.product_id,
    products.name as product_name,
    products.category as product_category,
    product_prices.price as price
from order_items 
left join orders on order_items.order_id = orders.id
left join products on order_items.product_id = products.id
left join product_prices on order_items.product_id = product_prices.product_id
and orders.created_at between product_prices.created_at and product_prices.ended_at