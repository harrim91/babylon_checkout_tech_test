class Checkout
	def initialize promotions = [], basket_klass = Basket
		@promotions = promotions.sort { |x, y| x.priority <=> y.priority }
		@basket = basket_klass.new
	end

	def scan product
		@basket.add product
	end

	def total
		apply_discounts
		@basket.total.round 2
	end

	private
	def apply_discounts
		@promotions.each { |rule| rule.apply(@basket) }
	end

end