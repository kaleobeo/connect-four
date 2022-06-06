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

  def ==(other)
    return super unless other.is_a?(Coordinate)

    col == other.col && row == other.row
  end
end