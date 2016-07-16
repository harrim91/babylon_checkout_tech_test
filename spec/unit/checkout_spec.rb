describe Checkout do
	subject(:checkout) { described_class.new }
	let(:item) { double :item, price: 9.95 }

	describe '#total' do
		it 'returns 0 if nothing has been scanned' do
			expect(checkout.total).to eq 0.00
		end
	end

	describe '#scan' do
		it 'adds the item to the basket' do
			checkout.scan item
			expect(checkout.total).to eq item.price
		end
	end

end