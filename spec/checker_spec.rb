require_relative '../lib/library'

describe Checker do
  describe '#to_s' do

    it 'returns a circle when no symbol is given on instantiation' do
      string_checker = described_class.new('red')
      symbol = string_checker.to_s
      expect(symbol).to eq "\u25CF".red
    end

    it 'tries to colorize the symbol' do
      symbol = double('symbol')
      color_checker = described_class.new('red', symbol)
      allow(symbol).to receive(:send).with(:red)
      "#{color_checker}"
      expect(symbol).to have_received(:send).with(:red)
    end
  end
end