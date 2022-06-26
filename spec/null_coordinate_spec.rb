# frozen_string_literal: true

require_relative '../lib/library'

describe NullCoordinate do
  subject(:null_coord) { described_class.new }

  describe '#row' do
    it 'returns nil' do
      null_row = null_coord.row
      expect(null_row).to be_nil
    end
  end

  describe '#col' do
    it 'returns nil' do
      null_col = null_coord.col
      expect(null_col).to be_nil
    end
  end

  describe '#up' do
    it 'returns a NullCoordinate' do
      up_coord = null_coord.up
      expect(up_coord).to be_instance_of(described_class)
    end
  end

  describe '#down' do
    it 'returns a NullCoordinate' do
      down_coord = null_coord.down
      expect(down_coord).to be_instance_of(described_class)
    end
  end

  describe '#left' do
    it 'returns a NullCoordinate' do
      left_coord = null_coord.left
      expect(left_coord).to be_instance_of(described_class)
    end
  end

  describe '#right' do
    it 'returns a NullCoordinate' do
      right_coord = null_coord.right
      expect(right_coord).to be_instance_of(described_class)
    end
  end
end
