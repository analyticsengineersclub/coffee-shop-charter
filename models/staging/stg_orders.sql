select 
	cast(id as string) as id,
	cast(created_at as timestamp) as created_at,
	cast(total as int64) as total,
	cast(address as string) as address,
	cast(state as string) as state,
	cast(zip as int64) as zip
from `analytics-engineers-club.coffee_shop.orders`