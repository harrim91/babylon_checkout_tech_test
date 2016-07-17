describe Checkout do
	let(:heart) { double :heart, price: 9.25 }
	let(:cufflinks) { double :cufflinks, price: 45.00 }
	let(:shirt) { double :shirt, price: 19.95 }
	let(:promo_1) { double :promotion, priority: 1, apply: 10 }
	let(:promo_2) { double :promotion, priority: 2, apply: 5 }

	context 'no promotional rules loaded' do
		subject(:checkout) { described_class.new }
		describe '#total' do
			context 'no items have been scanned' do
				it 'returns 0' do
					expect(checkout.total).to eq 0
				end
			end
			context 'items have been scanned' do
				before { checkout.scan shirt }
				it 'returns the value of the scanned items' do
					expect(checkout.total).to eq 19.95
				end
			end
		end
	end

	context 'promotional rules are loaded' do
		subject(:checkout) { described_class.new [promo_1, promo_2] }
		describe '#total' do
			context 'basket is empty' do
				it 'returns zero' do
					expect(checkout.total).to eq 0
				end
			end
			context 'discount value greater than basket total' do
				before { checkout.scan heart }
				it 'returns zero' do
					expect(checkout.total).to eq 0
				end
			end
			context 'basket value greater than discount value' do
				before { checkout.scan cufflinks }
				it 'returns the basket value with all discounts subtracted' do
					expect(checkout.total).to eq 30.00
				end
			end
		end
	end


end