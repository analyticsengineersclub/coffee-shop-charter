with date as (
    select * from {{ref('dim_dates')}}
),

    customers as (
    select * from {{ref('dim_customers')}}
),

    order_items as (
     select 
        date(order_items.order_date) as order_date,
        date(customers.first_order) as first_order,

        case when date_diff(date(order_items.order_date),date(customers.first_order), day) <=1 
            then "New" else "Returning" end as customer_type,

        order_items.price,
        date.year,
        date.year_week
     from {{ref('fct_order_items')}} as order_items
        left join customers on order_items.customer_id = customers.id
        left join date on date(order_items.order_date) = date.full_date
)

select 
    order_items.year,
    order_items.year_week,
    order_items.customer_type,
    sum(order_items.price) as revenue
from order_items
group by 1,2,3