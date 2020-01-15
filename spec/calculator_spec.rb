require 'calculator'
require 'order'

describe Calculator do

  let(:order) { double("Order") }

  describe '#total' do
    it 'outputs total bill + tax when input order' do
      input = "Jane\n2 x Cafe Latte\n1 x Blueberry Muffin\n1 x Choc Mudcake"
      order = subject.order(input)
      output = { "Tax" => "$1.72",
                 "Total" => "$19.95"}
      expect(subject.get_tax_total).to eq output
    end
  end
end
