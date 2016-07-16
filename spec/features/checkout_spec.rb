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
end