# frozen_string_literal: true

require_relative '../lib/library'

describe Coordinate do
  describe '#up' do
    context 'when the position above is in bounds' do
      subject(:up_coord) { described_class.new(4, 3) }

      it 'returns the Coordinate above it' do
        coord = up_coord.up
        expected = described_class.new(4, 4)
        expect(coord).to eq expected
      end
    end

    context 'when the position above is not in bounds' do
      subject(:up_coord) { described_class.new(1, 6) }

      it 'return a NullCoordinate' do
        coord = up_coord.up
        expect(coord).to be_instance_of(NullCoordinate)
      end
    end
  end
end