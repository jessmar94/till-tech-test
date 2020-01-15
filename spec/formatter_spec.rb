require 'formatter'

describe Format do

  describe '#format_money' do
    it 'converts integer to formatted stirng' do
      input = 19.95000000000000
      output = "$19.95"
      expect(subject.format_money(input)).to eq output
    end
  end
end
