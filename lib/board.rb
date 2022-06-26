# frozen_string_literal: true

# Board class manages checking for wins, and the feature of dropping checkers down to the lowest point in a column. 
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
    if current_cell.place_symbol(color)
      current_cell
    else
      drop_checker(color, col, row + 1)
    end
  end

  def check_for_win(color, pos)
    line_colors = winning_lines(pos).map { |line| map_pos_to_checkers(line) }
    line_colors.each do |line|
      line.each_cons(4) do |four_row|
        return true if four_row.all? { |checker_color| checker_color == color }
      end
    end
    false
  end

  def display_board(row = 6)
    return unless row.between?(1, 6)

    puts @board[row - 1].map(&:to_s).join('|')
    puts '--------------'

    display_board(row - 1)
  end

  private

  def build_empty_board
    (Array.new(6) { Array.new(7) }).each_with_index do |row, height|
      row.map!.with_index { |_cell, col| Cell.new(Checker, Coordinate.new(col + 1, height + 1)) }
    end
  end

  def map_pos_to_checkers(arr)
    arr.map { |pos| at(pos)&.piece_color}
  end

  def winning_lines(pos)
    [pos.diag_line_ne_sw, pos.diag_line_nw_se, pos.horiz_line, pos.vert_line]
  end
end
