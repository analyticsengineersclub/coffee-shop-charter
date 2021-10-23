with orders as (
        select
                customer_id,
                min(created_at) as first_order,
                count(*) as count
        from `analytics-engineers-club.coffee_shop.orders`
       group by 1
),
customers as (
        select *
        from `analytics-engineers-club.coffee_shop.customers`
)

select 
        customers.id,
        customers.name,
        customers.email,
        orders.first_order,
        orders.count
from customers
left join orders on customers.id = orders.customer_id
