class Basket
	def initialize
		@basket = []
	end

	def total
		@basket.inject(0) { |sum, product| sum + product.price }
	end

	def add product
		@basket << product
	end

	def quantity_of product_code
		@basket.select { |product| product.code == product_code }.count
	end

end