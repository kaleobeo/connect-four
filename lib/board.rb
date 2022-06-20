class Board
  def initialize
    @board = build_empty_board
  end

  def at(pos)
    return nil if pos.is_a?(NullCoordinate) || pos.out_of_bounds?

    @board.dig(pos.row - 1, pos.col - 1)
  end

  def drop_checker(color, col, row = 1)
    pos = Coordinate.new(col, row)
    return false if pos.out_of_bounds?

    current_cell = at(pos)
    drop_checker(color, col, row + 1) unless current_cell.place_symbol(color)
  end

  private

  def build_empty_board
    (Array.new(6) { Array.new(7) }).each_with_index do |row, height|
      row.map!.with_index { |_cell, col| Cell.new(Checker, Coordinate.new(col + 1, height + 1)) }
    end
  end
end