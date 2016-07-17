class MinimumSpendPromotion
	def initialize minimum_spend, discount, priority=0
		@minimum_spend = minimum_spend
		@discount = discount
		@priority = priority
	end

	attr_reader :priority

	def apply basket
		total = basket.inject(0) { |sum, product| sum + product.price }
		return total >= @minimum_spend ? ((total * @discount) / 100).round(2) : 0
	end
end