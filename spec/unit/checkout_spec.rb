describe Checkout do
	let(:basket) { double :basket, total: 10}
	let(:basket_klass) { double :basket_klass, new: basket }
	let(:shirt) { double :shirt, price: 19.95 }
	let(:promo_1) { double :promotion, priority: 1, apply: nil }
	let(:promo_2) { double :promotion, priority: 2, apply: nil }
	let(:promo_rules) { [promo_1, promo_2] }
	subject(:checkout) { described_class.new promo_rules, basket_klass }

	describe '#initialize' do
		subject(:checkout_klass) { described_class }
		after(:each) { checkout_klass.new promo_rules }
		it 'sorts the promotional rules' do
			expect(promo_rules).to receive(:sort)
		end
		it 'checks the priority of the promo rules' do
			expect(promo_1).to receive(:priority)
		end
	end

	describe '#scan' do
		it 'adds the item to the basket' do
			expect(basket).to receive(:add).with shirt
			checkout.scan shirt
		end
	end

	describe 'total' do
		it 'applies discounts' do
			promo_rules.each do |promotion|
				expect(promotion).to receive(:apply).with basket
				checkout.total
			end
		end
		it 'returns the basket total' do
			expect(checkout.total).to eq 10.00
		end
	end

end