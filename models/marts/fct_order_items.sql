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
),

    customers as (
    select * from {{ref('dim_customers')}}
    )

select 

    order_items.order_id,
    order_items.product_id,

from order_items 
