select 
	cast(id as string) as id,
	cast(order_id as string) as order_id,
	cast(product_id as int64) as product_id
from `analytics-engineers-club.coffee_shop.order_items`