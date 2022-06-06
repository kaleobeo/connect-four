# frozen_string_literal: true

require_relative '../lib/library'

describe NullCoordinate do
  subject(:null_coord) { described_class.new }

  describe '#up' do
    it 'returns a NullCoordinate' do
      up_coord = null_coord.up
      expect(up_coord).to be_instance_of(described_class)
    end
  end
end