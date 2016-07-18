describe MinimumSpendPromotion do
	let(:discount) { double :discount }
	let(:discount_klass) { double :discount_klass, new: discount }
	subject(:promotion) { described_class.new 60, 10, 2, discount_klass}

	describe '#priority' do
		it 'returns the given priority' do
			expect(promotion.priority).to eq 2
		end
	end

	describe '#apply' do
		context 'basket does not qualify for discount' do
			let(:basket) { double :basket, total: 59 }
			it 'does not add a discount to the basket' do
				expect(basket).not_to receive(:add)
				promotion.apply basket
			end
		end
		context 'basket qualifies for discount' do
			let(:basket) { double :basket, total: 60 }
			it 'add a discount to the basket' do
				expect(basket).to receive(:add).with discount
				promotion.apply basket
			end
		end
	end
end