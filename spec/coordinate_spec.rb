# frozen_string_literal: true

require_relative '../lib/coordinate'

describe Coordinate do
  describe '#up' do
    context 'when the position above is in bounds' do
      subject(:in_bounds_coord) { described_class.new(4, 3) }

      it 'returns the Coordinate above it' do
        coord = in_bounds_coord.up
        expected = described_class.new(4, 4)
        expect(coord).to eq expected
      end
    end
  end
end