require 'receipt'

describe Receipt do

  describe '#get_receipt' do
    it 'takes order and returns receipt' do
      input = "Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake"
      subject.input_order(input)
      output = "#{Time.now.strftime("%d/%m/%Y %H:%M")}\nThe Coffee Connection\n123 Lakeside Way\n+1 (650) 360-0708\nJane\nCafe Latte 2 x 4.75\nBlueberry Muffin 1 x 4.05\nChoc Mudcake 1 x 6.40\nTax: $1.72\nTotal: $19.95"
      expect(subject.get_receipt).to eq output
    end
  end
end
