# frozen_string_literal: true

require_relative '../lib/library'

describe Coordinate do
  describe '#out_of_bounds?' do
    context 'when coordinate is out of bounds' do
      subject(:out_bounds_coord) { described_class.new(1, 7) }

      it 'returns true' do
        expect(out_bounds_coord.out_of_bounds?).to eq true
      end
    end

    context 'when coordinate is in bounds' do
      subject(:in_bounds_coord) { described_class.new(3, 4) }

      it 'returns false' do
        expect(in_bounds_coord.out_of_bounds?).to eq false
      end
    end
  end

  describe '#vert_line' do
    context 'when the coordinate is in the middle of the board' do
      subject(:vert_line_middle) { described_class.new(4, 3) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(4, 6),
          described_class.new(4, 5),
          described_class.new(4, 4),
          described_class.new(4, 3),
          described_class.new(4, 2),
          described_class.new(4, 1),
          NullCoordinate.new
        ]
        vert_arr = vert_line_middle.vert_line
        expect(vert_arr).to eq expected
      end
    end

    context 'when the coordinate is at the top of the board' do
      subject(:vert_line_top) { described_class.new(3, 6) }

      it 'returns the proper list of coordinates' do
        expected = [
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new,
          described_class.new(3, 6),
          described_class.new(3, 5),
          described_class.new(3, 4),
          described_class.new(3, 3)
        ]
        vert_arr = vert_line_top.vert_line
        expect(vert_arr).to eq expected
      end
    end

    context 'when the coordinate is at the bottom of the board' do
      subject(:vert_line_bottom) { described_class.new(3, 1) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(3, 4),
          described_class.new(3, 3),
          described_class.new(3, 2),
          described_class.new(3, 1),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
        ]
        vert_arr = vert_line_bottom.vert_line
        expect(vert_arr).to eq expected
      end
    end
  end

  describe '#horiz_line' do
    context 'when the coordinate is in the middle of the board' do
      subject(:horiz_line_middle) { described_class.new(4, 3) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(1, 3),
          described_class.new(2, 3),
          described_class.new(3, 3),
          described_class.new(4, 3),
          described_class.new(5, 3),
          described_class.new(6, 3),
          described_class.new(7, 3)
        ]
        horiz_arr = horiz_line_middle.horiz_line
        expect(horiz_arr).to eq expected
      end
    end

    context 'when the coordinate is at the left of the board' do
      subject(:horiz_line_left) { described_class.new(1, 6) }

      it 'returns the proper list of coordinates' do
        expected = [
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new,
          described_class.new(1, 6),
          described_class.new(2, 6),
          described_class.new(3, 6),
          described_class.new(4, 6)
        ]
        horiz_arr = horiz_line_left.horiz_line
        expect(horiz_arr).to eq expected
      end
    end

    context 'when the coordinate is at the right of the board' do
      subject(:horiz_line_right) { described_class.new(7, 6) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(4, 6),
          described_class.new(5, 6),
          described_class.new(6, 6),
          described_class.new(7, 6),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
        ]
        horiz_arr = horiz_line_right.horiz_line
        expect(horiz_arr).to eq expected
      end
    end
  end

  describe '#diag_line_nw_se' do
    context 'when the coordinate is in the middle of the board' do
      subject(:diag_line_middle) { described_class.new(4, 3) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(1, 6),
          described_class.new(2, 5),
          described_class.new(3, 4),
          described_class.new(4, 3),
          described_class.new(5, 2),
          described_class.new(6, 1),
          NullCoordinate.new
        ]
        diag_arr = diag_line_middle.diag_line_nw_se
        expect(diag_arr).to eq expected
      end
    end

    context 'when the coordinate is at the top right of the board' do
      subject(:diag_line_top_left) { described_class.new(7, 6) }

      it 'returns the proper list of coordinates' do
        expected = [
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new,
          described_class.new(7, 6),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
          ]
        diag_arr = diag_line_top_left.diag_line_nw_se
        expect(diag_arr).to eq expected
      end
    end

    context 'when the coordinate is at the bottom right of the board' do
      subject(:diag_line_bot_right) { described_class.new(7, 1) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(4, 4),
          described_class.new(5, 3),
          described_class.new(6, 2),
          described_class.new(7, 1),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
        ]
        diag_arr = diag_line_bot_right.diag_line_nw_se
        expect(diag_arr).to eq expected
      end
    end
  end

  describe '#diag_line_ne_sw' do
    context 'when the coordinate is in the middle of the board' do
      subject(:diag_line_middle) { described_class.new(4, 3) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(7, 6),
          described_class.new(6, 5),
          described_class.new(5, 4),
          described_class.new(4, 3),
          described_class.new(3, 2),
          described_class.new(2, 1),
          NullCoordinate.new
        ]
        diag_arr = diag_line_middle.diag_line_ne_sw
        expect(diag_arr).to eq expected
      end
    end

    context 'when the coordinate is at the bottom right of the board' do
      subject(:diag_line_bot_right) { described_class.new(7, 1) }

      it 'returns the proper list of coordinates' do
        expected = [
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new,
          described_class.new(7, 1),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
        ]
        diag_arr = diag_line_bot_right.diag_line_ne_sw
        expect(diag_arr).to eq expected
      end
    end

    context 'when the coordinate is at the bottom left of the board' do
      subject(:diag_line_bot_left) { described_class.new(1, 1) }

      it 'returns the proper list of coordinates' do
        expected = [
          described_class.new(4, 4),
          described_class.new(3, 3),
          described_class.new(2, 2),
          described_class.new(1, 1),
          NullCoordinate.new,
          NullCoordinate.new,
          NullCoordinate.new
        ]
        diag_arr = diag_line_bot_left.diag_line_ne_sw
        expect(diag_arr).to eq expected
      end
    end
  end
end