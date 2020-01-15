require 'calculator'
require 'order'

describe Calculator do

  let(:order) { double("Order") }

  describe '#total' do
    it 'outputs total bill + tax when input order' do
      input = {"Cafe Latte" => 2,
          "Blueberry Muffin" => 1,
          "Choc Mudcake" => 1
        }
      output = { "Tax" => "$1.72",
                 "Total" => "$19.95"}
      expect(subject.get_tax_total(input)).to eq output
    end
  end
end
