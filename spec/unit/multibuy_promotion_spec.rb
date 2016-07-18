describe MultibuyPromotion do
	let(:discount) { double :discount }
	let(:discount_klass) { double :discount_klass, new: discount }
	let(:basket) { double :basket }
	subject(:promotion) { described_class.new '001', 2, 0.75, 3, discount_klass }

	describe '#priority' do
		it 'returns the given priority' do
			expect(promotion.priority).to eq 3
		end
	end

	describe '#apply' do
		context 'basket does not qualify for discount' do
			it 'does not add a discount to the basket' do
				allow(basket).to receive(:quantity_of).with('001').and_return 1
				expect(basket).not_to receive(:add)
				promotion.apply basket
			end
		end
		context 'basket qualifies for discount' do
			it 'add a discount to the basket' do
				allow(basket).to receive(:quantity_of).with('001').and_return 2
				expect(basket).to receive(:add).with discount
				promotion.apply basket
			end
		end
	end
end