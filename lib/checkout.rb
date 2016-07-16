class Checkout
	def initialize
		@basket = []
	end

	def scan product
		@basket << product
	end

	def total
		return 0 if @basket.empty?
		total = @basket.inject(0) { |sum, product| sum + product.price }
		total -= (0.75 * heart_count) if heart_count >= 2
		return total >= 60 ? (total * 0.9).round(2) : total
	end

	private
	def heart_count
		hearts = @basket.select { |item| item.code == 001 }
		return hearts.size
	end
end