describe Product do
	subject(:product) { described_class.new '001', 'Lavender heart', 925 }

	describe '#initialize' do
		subject(:klass) { described_class }

		it 'is initialized with 3 arguments' do
			expect(klass.new '001', 'Lavender heart', 925).to be_a klass
		end

		it 'errors with less than 3 arguments' do
			expect{ klass.new 'Lavender heart', 925 }.to raise_error ArgumentError
		end
	end

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
		it 'returns the product code' do
			expect(product.price).to eq 925
		end
	end


end