class Discount

	CODE = 'PROMO'

	def initialize name, price
		@code = CODE
		@name = name
		@price = -price
	end

	attr_reader :code, :name, :price
end