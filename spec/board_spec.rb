# frozen_string_literal: true

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

  describe '#check_for_win' do
    context 'when a horizontal win is present at the bottom' do
      subject(:horiz_win_board) { described_class.new }

      before do
        horiz_win_board.drop_checker(:red, 1)
        horiz_win_board.drop_checker(:red, 2)
        horiz_win_board.drop_checker(:red, 3)
      end

      it 'returns true when checking for red' do
        pos = Coordinate.new(4, 1)
        horiz_win_board.drop_checker(:red, 4)
        status = horiz_win_board.check_for_win(:red, pos)
        expect(status).to eq true
      end

      it 'returns false when checking for another color' do
        pos = Coordinate.new(4, 1)
        horiz_win_board.drop_checker(:red, 4)
        status = horiz_win_board.check_for_win(:yellow, pos)
        expect(status).to eq false
      end
    end

    context 'when a broken horizontal line is present' do
      subject(:broken_horiz_board) { described_class.new }

      before do
        broken_horiz_board.drop_checker(:red, 1)
        broken_horiz_board.drop_checker(:red, 2)
        broken_horiz_board.drop_checker(:red, 3)
      end

      it 'returns false' do
        pos = Coordinate.new(5, 1)
        broken_horiz_board.drop_checker(:red, 5)
        status = broken_horiz_board.check_for_win(:red, pos)
        expect(status).to eq false
      end
    end

    context 'when a vertical line is present' do
      subject(:vert_win_board) { described_class.new }

      before do
        3.times { vert_win_board.drop_checker(:red, 1) }
      end

      it 'returns true' do
        pos = Coordinate.new(1, 4)
        vert_win_board.drop_checker(:red, 1)
        status = vert_win_board.check_for_win(:red, pos)
        expect(status).to eq true
      end
    end

    context 'when a broken vertical line is present' do
      subject(:broken_vert_board) { described_class.new }

      before do
        3.times { broken_vert_board.drop_checker(:red, 1) }
        broken_vert_board.drop_checker(:yellow, 1)
      end

      it 'returns false' do
        pos = Coordinate.new(1, 5)
        broken_vert_board.drop_checker(:red, 1)
        status = broken_vert_board.check_for_win(:red, pos)
        expect(status).to eq false
      end
    end

    context 'when a nw -> se diagonal is present' do
      subject(:nw_se_diag_board) { described_class.new }

      before do
        3.times { nw_se_diag_board.drop_checker(:yellow, 1) }
        nw_se_diag_board.drop_checker(:red, 1)
        2.times { nw_se_diag_board.drop_checker(:yellow, 2) }
        nw_se_diag_board.drop_checker(:red, 2)
        nw_se_diag_board.drop_checker(:yellow, 3)
        nw_se_diag_board.drop_checker(:red, 3)
      end

      it 'returns true' do
        pos = Coordinate.new(4, 1)
        nw_se_diag_board.drop_checker(:red, 4)
        status = nw_se_diag_board.check_for_win(:red, pos)
        expect(status).to eq true
      end
    end

    context 'when a ne -> sw diagonal is present' do
      subject(:ne_sw_diag_board) { described_class.new }

      before do
        ne_sw_diag_board.drop_checker(:red, 1)
        ne_sw_diag_board.drop_checker(:yellow, 2)
        ne_sw_diag_board.drop_checker(:red, 2)
        2.times { ne_sw_diag_board.drop_checker(:yellow, 3) }
        ne_sw_diag_board.drop_checker(:red, 3)
        3.times { ne_sw_diag_board.drop_checker(:yellow, 4) }
        ne_sw_diag_board.drop_checker(:red, 4)
      end

      it 'returns true' do
        pos = Coordinate.new(4, 4)
        ne_sw_diag_board.drop_checker(:red, 4)
        status = ne_sw_diag_board.check_for_win(:red, pos)
        expect(status).to eq true
      end
    end
  end
end
