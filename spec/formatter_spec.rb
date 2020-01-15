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
      order = {"Jane" => {
          "Cafe Latte" => 2,
          "Blueberry Muffin" => 1,
          "Choc Mudcake" => 1}
        }
      output = "#{Time.now.strftime("%d/%m/%Y %H:%M")}
        The Coffee Connection
        123 Lakeside May
        +1 (650) 360-0708
        Jane
        Cafe Latte 2 x 4.75
        Blueberry Muffin 1 x 4.05
        Choc Mudcake 1 x 6.40
        Tax: $1.72
        Total: $19.95"
      expect(subject.format_bill(order)).to eq output
    end
  end
end
