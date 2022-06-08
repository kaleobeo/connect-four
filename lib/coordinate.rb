# frozen_string_literal: true

class Coordinate
  attr_reader :row, :col

  def initialize(col, row)
    @row = row
    @col = col
    @max_row = 6
    @max_col = 7
  end

  def up
    up_coord_height = row + 1
    up_coord_height < @max_row ? Coordinate.new(col, up_coord_height) : NullCoordinate.new
  end

  def down
    down_coord_height = row - 1
    down_coord_height.positive? ? Coordinate.new(col, down_coord_height) : NullCoordinate.new
  end

  def left
    left_coord_col = col - 1
    left_coord_col.between?(1, 7) ? Coordinate.new(left_coord_col, row) : NullCoordinate.new 
  end

  def right
    right_coord_col = col + 1
    right_coord_col.between?(1, 7) ? Coordinate.new(right_coord_col, row) : NullCoordinate.new
  end

  def ==(other)
    return super unless other.is_a?(Coordinate)

    col == other.col && row == other.row
  end
end