class Checkout
	def initialize
		@basket = []
	end

	def scan product
		@basket << product
	end

	def total
		return 0 if @basket.empty?
		@basket.inject(0) { |sum, product| sum + product.price }
	end
end