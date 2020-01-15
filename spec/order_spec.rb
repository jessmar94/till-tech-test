require 'order'

describe Order do

  describe '#receive_order' do
    it 'converts the order to a hash' do
      input = "Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake"
      output = {"Cafe Latte" => 2,
          "Blueberry Muffin" => 1,
          "Choc Mudcake" => 1
        }
      expect(subject.receive_order(input)).to eq output
    end
  end

  describe '#get_customer' do
    it 'gets the customer name' do
      input = "Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake"
      output = "Jane"
      expect(subject.get_customer(input)).to eq output
    end
  end
end
