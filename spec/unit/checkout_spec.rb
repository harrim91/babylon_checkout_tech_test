describe Checkout do
	subject(:checkout) { described_class.new }
	let(:heart) { double :heart, code: 001, price: 9.25 }
	let(:cufflinks) { double :cufflinks, code: 002, price: 45.00 }
	let(:shirt) { double :shirt, code: 003, price: 19.95 }

	describe '#total' do
		it 'returns 0 if nothing has been scanned' do
			expect(checkout.total).to eq 0.00
		end
		
		it 'returns the value of the scanned items' do
			checkout.scan heart
			expect(checkout.total).to eq 9.25
		end

		context 'scanning two hearts' do
			before { 2.times { checkout.scan heart } }
			it 'reduces the price to 8.50' do
				expect(checkout.total).to eq 17.00
			end
		end

		context 'total is greater than 60' do
			before do
				checkout.scan heart
				checkout.scan cufflinks
				checkout.scan shirt				
			end
			it 'applies a 10% discount' do
				expect(checkout.total).to eq 66.78
			end
		end
	end

	context 'two hearts and more than 60 total' do
		before do
			checkout.scan heart
			checkout.scan cufflinks
			checkout.scan heart
			checkout.scan shirt	
		end
		it 'applies the hearts discount before the 10% discount' do
			expect(checkout.total).to equal 73.76
		end
	end


end