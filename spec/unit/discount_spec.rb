describe Discount do
	subject(:discount) { described_class.new 'Multibuy Promotion', 12.34 }

	describe '#code' do
		it 'has a product code of PROMO' do
			expect(discount.code).to eq 'PROMO'
		end
	end

	describe '#name' do
		it 'returns the product name' do
			expect(discount.name).to eq 'Multibuy Promotion'
		end
	end

	describe '#price' do
		it 'returns the given discount value as a negative' do
			expect(discount.price).to eq -12.34
		end
	end

end