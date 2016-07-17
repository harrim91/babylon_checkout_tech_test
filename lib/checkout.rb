class Checkout
	def initialize promo_rules = []
		@promo_rules = promo_rules.sort { |x, y| x.priority <=> y.priority }
		@basket = []
	end

	def scan product
		@basket << product
	end

	def total
		basket_value = @basket.inject(0) { |sum, product| sum + product.price }
		discount = @promo_rules.inject(0) { |sum, rule| sum + rule.apply(@basket) }
		total = (basket_value - discount).round 2
		return total > 0 ? total : 0
	end

end