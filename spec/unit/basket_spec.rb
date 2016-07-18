describe Basket do
	let(:product) { double :product, code: '001', price: 20.00 }
	subject(:basket) { described_class.new }

	describe '#total' do
		it 'is initialized as zero' do
			expect(basket.total).to eq 0
		end
	end

	describe '#add' do
		it 'adds the product to the basket' do
			expect { basket.add product }.to change { basket.total }.to 20.00
		end
	end

	describe '#quantity_of' do
		before { basket.add product }
		it 'returns the quantity of the product in the basket' do
			expect(basket.quantity_of '001').to eq 1
		end
		it 'returns zero if the product is not in the basket' do
			expect(basket.quantity_of '002').to eq 0
		end
	end
end