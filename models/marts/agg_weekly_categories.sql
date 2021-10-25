with date as (
    select * from {{ref('dim_dates')}}
),

    products as (
    select * from {{ref('dim_products')}}
),

    order_items as (
     select 
        date(order_items.order_date) as order_date,
        products.category,
        order_items.price,
        date.year,
        date.year_week
     from {{ref('fct_order_items')}} as order_items
        left join products on order_items.product_id = products.id
        left join date on date(order_items.order_date) = date.full_date
)

select 
    order_items.year,
    order_items.year_week,
    order_items.category,
    sum(order_items.price) as revenue
from order_items
group by 1,2,3