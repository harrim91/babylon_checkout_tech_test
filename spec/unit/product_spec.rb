describe Product do
	subject(:product) { described_class.new '001', 'Lavender heart', 9.00 }

	describe '#code' do
		it 'returns the product code' do
			expect(product.code).to eq '001'
		end
	end

	describe '#name' do
		it 'returns the product name' do
			expect(product.name).to eq 'Lavender heart'
		end
	end

	describe '#price' do
		it 'returns the product price' do
			expect(product.price).to eq 9.00
		end
	end

end
