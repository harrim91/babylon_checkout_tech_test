describe MultibuyPromotion do
	subject(:multibuy) { described_class.new 001, 2, 0.75, 2}
	let(:heart) { double :heart, code: 001 }
	let(:shirt) { double :shirt, code: 002 }

	describe '#initialize' do
		subject(:multibuy) { described_class.new 001, 2, 0.75 }
		it 'has an optional priority argument which defaults to 0' do
			expect(multibuy.priority).to eq 0
		end
	end

	describe '#priority' do
		it 'returns the given priority' do
			expect(multibuy.priority).to eq 2
		end
	end

	describe '#apply' do
		context 'basket does not qualify for discount' do
			let(:basket) { [heart, shirt] }
			it 'returns 0' do
				expect(multibuy.apply basket).to eq 0
			end
		end
		context 'basket qualifies for discount' do
			let(:basket) { [heart, shirt, heart] }
			it 'returns the correct discount amount' do
				expect(multibuy.apply basket).to eq 1.50
			end
		end
	end
end