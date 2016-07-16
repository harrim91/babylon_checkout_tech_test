class Product
	def initialize code, name, price
		@code = code
		@name = name
		@price = price.round 2
	end

	attr_reader :code, :name, :price
end