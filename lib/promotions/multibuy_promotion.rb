class MultibuyPromotion

	NAME = 'Multibuy Promotion'

	def initialize code, quantity, discount, priority, discount_klass=Discount
		@code = code
		@quantity = quantity
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
		return 0 if basket.quantity_of(@code) < @quantity
		(@discount * basket.quantity_of(@code))
	end

end