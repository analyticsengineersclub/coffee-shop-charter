select
	cast(id as int64) as id,
	cast(product_id as int64) as product_id,
	cast(price as int64) as price,
	cast(created_at as timestamp) as created_at,
	cast(ended_at as timestamp) as ended_at
from `analytics-engineers-club.coffee_shop.product_prices`