class MultibuyPromotion

	def initialize code, quantity, discount, priority
		@code = code
		@quantity = quantity
		@discount = discount
		@priority = priority
	end

	attr_reader :priority

	def apply basket
		items = basket.select { |item| item.code == @code }
		return items.count >= @quantity ? (@discount * items.count).round(2) : 0
	end

end