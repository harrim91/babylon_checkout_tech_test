describe 'Checkout' do
	let(:checkout) { Checkout.new }
	let(:lavender_heart) { Product.new 001, 'Lavender heart', 9.25 }
	let(:cufflinks) { Product.new 002, 'Personalised cufflinks', 45.00 }
	let(:tshirt) { Product.new 003, 'Lavender heart', 19.95 }

	context 'checking out with no promotion applied' do
		it 'adds the totals correctly' do
			checkout.scan lavender_heart
			checkout.scan cufflinks
			expect(checkout.total).to eq 54.25
		end
	end

	context 'spending more than 60' do
		it 'applies a 10% discount' do
			checkout.scan lavender_heart
			checkout.scan cufflinks
			checkout.scan tshirt
			expect(checkout.total).to eq 66.78
		end
	end

	context 'with two lavender hearts' do
		it 'reduces the price of the lavender hearts to 8.50' do
			checkout.scan lavender_heart
			checkout.scan tshirt
			checkout.scan lavender_heart
			expect(checkout.total).to eq 36.95
		end
	end

	context 'two lavender hearts and more than 60 total' do
		it 'reduces lavender hearts to 8.50 before applying 10% discount' do
			checkout.scan lavender_heart
			checkout.scan tshirt
			checkout.scan lavender_heart
			checkout.scan cufflinks
			expect(checkout.total).to eq 73.76
		end
	end
end