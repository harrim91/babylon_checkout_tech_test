describe MinimumSpendPromotion do
	subject(:promotion) { described_class.new 60, 10, 2}
	let(:heart) { double :heart, price: 9.25 }
	let(:cufflinks) { double :cufflinks, price: 45.00 }
	let(:shirt) { double :shirt, price: 19.95 }

	describe '#initialize' do
		subject(:promotion) { described_class.new 60, 10 }
		it 'has an optional priority argument which defaults to 0' do
			expect(promotion.priority).to eq 0
		end
	end

	describe '#priority' do
		it 'returns the given priority' do
			expect(promotion.priority).to eq 2
		end
	end

	describe '#apply' do
		context 'basket does not qualify for discount' do
			let(:basket) { [heart, cufflinks] }
			it 'returns 0' do
				expect(promotion.apply basket).to eq 0
			end
		end
		context 'basket qualifies for discount' do
			let(:basket) { [cufflinks, shirt] }
			it 'returns the correct discount amount' do
				expect(promotion.apply basket).to eq 6.50
			end
		end
	end
end