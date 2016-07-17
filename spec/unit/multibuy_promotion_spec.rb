describe MultibuyPromotion do
	subject(:promotion) { described_class.new '001', 2, 0.75, 2}
	let(:heart) { double :heart, code: '001' }
	let(:shirt) { double :shirt, code: '002' }

	describe '#priority' do
		it 'returns the given priority' do
			expect(promotion.priority).to eq 2
		end
	end

	describe '#apply' do
		context 'basket does not qualify for discount' do
			let(:basket) { [heart, shirt] }
			it 'returns 0' do
				expect(promotion.apply basket).to eq 0
			end
		end
		context 'basket qualifies for discount' do
			let(:basket) { [heart, shirt, heart] }
			it 'returns the correct discount amount' do
				expect(promotion.apply basket).to eq 1.50
			end
		end
	end
end