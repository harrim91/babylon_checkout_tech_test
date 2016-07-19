class Product
	def initialize code, name, price
		@code = code
		@name = name
		@price = price.to_f
	end

	attr_reader :code, :name, :price
end