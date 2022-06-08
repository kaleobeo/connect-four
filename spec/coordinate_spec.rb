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

  describe '#down' do
    context 'when the position below is in bounds' do
      subject(:valid_down) { described_class.new(4, 3) }

      it 'returns the Coordinate below it' do
        coord = valid_down.down
        expected = described_class.new(4, 2)
        expect(coord).to eq expected
      end
    end

    context 'when the position below is not in bounds' do
      subject(:invalid_down) { described_class.new(1, 1) }

      it 'return a NullCoordinate' do
        coord = invalid_down.down
        expect(coord).to be_instance_of(NullCoordinate)
      end
    end
  end

  describe '#left' do
    context 'when the position to the left is in bounds' do
      subject(:valid_left) { described_class.new(4, 3) }

      it 'returns the Coordinate left of it' do
        coord = valid_left.left
        expected = described_class.new(3, 3)
        expect(coord).to eq expected
      end
    end

    context 'when the position left is not in bounds' do
      subject(:invalid_left) { described_class.new(1, 1) }

      it 'return a NullCoordinate' do
        coord = invalid_left.left
        expect(coord).to be_instance_of(NullCoordinate)
      end
    end
  end

  describe '#right' do
    context 'when the position to the right is in bounds' do
      subject(:valid_right) { described_class.new(4, 3) }

      it 'returns the Coordinate left of it' do
        coord = valid_right.right
        expected = described_class.new(5, 3)
        expect(coord).to eq expected
      end
    end

    context 'when the position to the right is not in bounds' do
      subject(:invalid_right) { described_class.new(7, 1) }

      it 'return a NullCoordinate' do
        coord = invalid_right.right
        expect(coord).to be_instance_of(NullCoordinate)
      end
    end
  end
end