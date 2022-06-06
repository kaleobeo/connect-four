# frozen_string_literal: true

require_relative '../lib/library'

describe Cell do
  describe '#place_symbol' do
    subject(:place_cell) { described_class.new(checker_class) }

    let(:checker_class) { double('checker_class') }

    before do
      allow(checker_class).to receive(:new).and_return 'foo'
    end

    context 'when the cell is empty' do

      it 'creates a new Checker to fill the cell' do
        place_cell.place_symbol(:blue)
        expect(checker_class).to have_received(:new).once
      end

      it 'assigns the Checker to the cell\'s piece variable' do
        place_cell.place_symbol(:blue)
        expect(place_cell.piece).not_to be_nil
      end
    end

    context 'when the cell is full' do
      before do
        place_cell.place_symbol(:blue)
      end

      it 'does not create a new Checker' do
        place_cell.place_symbol(:red)
        expect(checker_class).to have_received(:new)
      end

      it 'does not change the cell\'s piece variable' do
        expect { place_cell.place_symbol(:red) }.not_to change(place_cell, :piece)
      end
    end
  end
end