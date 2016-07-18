class MinimumSpendPromotion

	NAME = 'Minimum Spend Promotion'

	def initialize minimum_spend, discount, priority, discount_klass = Discount
		@minimum_spend = minimum_spend
		@discount = discount
		@priority = priority
		@discount_klass = discount_klass
	end

	attr_reader :priority

	def apply basket
		discount_value = calculate_discount_value basket
		basket.add @discount_klass.new(NAME, discount_value) if discount_value > 0
	end

	private
	def calculate_discount_value basket
		return 0 unless basket.total >= @minimum_spend
		((basket.total * @discount) / 100)
	end
end