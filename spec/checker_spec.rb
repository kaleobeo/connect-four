# frozen_string_literal: true

require_relative '../lib/library'

describe Checker do
  describe '#to_s' do
    it 'returns a circle when no symbol is given on instantiation' do
      circle_checker = described_class.new('red')
      symbol = circle_checker.to_s
      expect(symbol).to eq "\u25CF".red
    end

    it 'returns the symbol given on instantiation' do
      letter_checker = described_class.new('red', 'a')
      symbol = letter_checker.symbol
      expect(symbol).to eq 'a'
    end

    it 'tries to colorize the symbol' do
      symbol = double('symbol')
      color_checker = described_class.new('red', symbol)
      allow(symbol).to receive(:send).with(:red)
      color_checker.to_s
      expect(symbol).to have_received(:send).with(:red)
    end
  end

  describe '#==' do
    subject(:red_checker) { described_class.new(:red) }

    context 'when comparing two Checkers' do
      let(:other_red_checker) { described_class.new(:red) }
      let(:yellow_checker) { described_class.new(:yellow) }

      it 'returns true when the checkers have the same color and symbol' do
        expect(red_checker).to eq other_red_checker
      end

      it 'returns false when checkers have different colors' do
        expect(red_checker).not_to eq yellow_checker
      end
    end

    context 'when comparing a checker with a different type of object' do
      it 'returns false' do
        expect(red_checker).not_to eq [1, 2, 3]
      end
    end
  end
end
