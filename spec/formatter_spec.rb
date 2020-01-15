require 'formatter'

describe Format do

  describe '#format_money' do
    it 'converts integer to formatted string' do
      input = 19.95000000000000
      output = "$19.95"
      expect(subject.format_money(input)).to eq output
    end
  end

  describe '#format_bill' do
    it 'converts order to formatted bill' do
      order = { "Cafe Latte" => 2,
          "Blueberry Muffin" => 1,
          "Choc Mudcake" => 1
        }
      customer = "Jane"
      output = "#{Time.now.strftime("%d/%m/%Y %H:%M")}\nThe Coffee Connection\n123 Lakeside Way\n+1 (650) 360-0708\nJane\nCafe Latte 2 x 4.75\nBlueberry Muffin 1 x 4.05\nChoc Mudcake 1 x 6.40\nTax: $1.72\nTotal: $19.95"
      expect(subject.format_bill(order, customer)).to eq output
    end
  end
end
