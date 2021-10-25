select 
	cast(id as int64) as id,
	cast(name as string) as name,
	cast(category as string) as category,
	cast(created_at as timestamp) as created_at
from `analytics-engineers-club.coffee_shop.products`