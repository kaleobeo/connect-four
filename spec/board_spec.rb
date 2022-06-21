require_relative '../lib/library'

describe Board do
  describe '#at' do
    context 'when given a position in bounds, bottom left' do
      subject(:in_bounds_at) { described_class.new }

      it 'returns a cell at that position' do
        position = Coordinate.new(1, 1)
        cell_position = in_bounds_at.at(position).position
        expect(cell_position).to eq position
      end
    end

    context 'when given a position in bounds, top right' do
      subject(:in_bounds_at) { described_class.new }

      it 'returns a cell at that position' do
        position = Coordinate.new(7, 6)
        cell_position = in_bounds_at.at(position).position
        expect(cell_position).to eq position
      end
    end

    context 'when given a position out of bounds' do
      subject(:out_bounds_at) { described_class.new }

      it 'returns nil' do
        position = Coordinate.new(10, 1)
        cell_position = out_bounds_at.at(position)
        expect(cell_position).to be_nil
      end
    end

    context 'when given a NullCoordinate' do
      subject(:null_at) { described_class.new }

      it 'returns nil' do
        position = NullCoordinate.new
        expect(null_at.at(position)).to be_nil
      end
    end
  end

  describe '#drop_checker' do
    subject(:drop_board) { described_class.new }

    

    context 'when a column is empty' do
      it 'places the checker in the bottom row of that column' do
        drop_board.drop_checker(:red, 1)
        cell = drop_board.at(Coordinate.new(1, 1))
        expect(cell.piece_color).to eq :red
      end
    end
    
    context 'when there is a small number of checkers already in the column' do
      before do
        2.times { drop_board.drop_checker(:red, 3) }
      end

      it 'places the checker on top of the stack' do
        drop_board.drop_checker(:red, 3)
        cell = drop_board.at(Coordinate.new(3, 3))
        expect(cell.piece_color).to eq :red
      end
    end
    
    context 'when a column has been played in 6 times' do
      before do
        6.times { drop_board.drop_checker(:yellow, 2) }
      end

      it 'the top spot is full' do
        cell = drop_board.at(Coordinate.new(2, 6))
        expect(cell.piece_color).to be :yellow
      end

      it 'trying to play again in the column returns false' do
        expect(drop_board.drop_checker(:yellow, 2)).to be false
      end
    end
  end
end