require 'order'

describe Order do

  describe '#receive_order' do
    it 'converts the order to a hash' do
      input = "Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake"
      output = {"Jane" => {
          "Cafe Latte" => 2,
          "Blueberry Muffin" => 1,
          "Choc Mudcake" => 1}
        }
      expect(subject.receive_order(input)).to eq output
    end
  end
end
